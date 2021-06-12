require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"
require 'redcarpet'
require 'yaml'
require 'bcrypt'

EXTENSIONS = [".txt", ".md",".jpg"]

def data_path
  if ENV["RACK_ENV"] == 'test'
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map { |path| File.basename(path) }.reject {|path| path.include?(".yaml")}

  @users = YAML.load_file(File.join(data_path, "users.yaml"))
end

helpers do
  def gen_dup_name(filename)
    file, extension = filename.split(".")
    if file.include?("_copy")
      file.gsub(/\A(.+\()(\d+)(\))/) {|match| "#{$1}#{$2.to_i + 1}#{$3}." } + extension
    else
      "#{file}_copy(1).#{extension}"
    end
  end

  def sorted_files
    @files.sort
  end
end

def generate_version_number(filename)
  if /_v\d\.\w+\z/.match(filename)
    filename.gsub(/(\A.+_v)(\d)(\.\w+\z)/) { |match| "#{$1}#{$2.to_i + 1}#{$3}"}
  else
    filename.gsub(/(\A.+)(\..+)/) { |match| "#{$1}_v2#{$2}"}
  end
end

def logged_in?
  session.key?(:user)
end

def require_signed_in_user
  unless logged_in?
    session[:error] = "You must be signed in to do that."
    redirect "/"
  end 
end

def valid_user?(usr, pwd)
  @users.any? {|user_name, hash| user_name.to_s == usr && BCrypt::Password.new(hash) == pwd}
end

def create_document(name, content="")
  File.open(File.join(data_path, name), "w") do |file|
    file.write(content)
  end
end

def write_to_yaml(file_path, username, hash)
  data = YAML.load(File.read(file_path))

  data[username.to_sym] = hash
  output = YAML.dump data

  File.write(file_path, output)
end

def create_new_user(username, password)
  hash = BCrypt::Password.create(password).to_s
  file_path = File.join(data_path, "users.yaml")

  write_to_yaml(file_path, username, hash)
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(file_path)
  content = File.read(file_path)
  case File.extname(file_path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
   erb render_markdown(content)
  when ".jpg"
    erb render_markdown(content)
  end
end

def filename_taken?(filename)
  @files.any? { |file| file == filename }
end

def username_taken?
  @users.key?(params[:username].to_sym)
end

def validate_file_name(file_name)
  file_path = File.join(data_path, file_name)
  extension = File.extname(file_path)

  if file_name.empty?
    "A name is required."
  elsif extension.empty?
    "An extension is required."
  elsif EXTENSIONS.none?(extension)
    "#{extension} is not supported."
  elsif filename_taken?(file_name)
    "That name is taken."
  end
end

def signup_errors
  if params[:username].empty?
    "A username is required."
  elsif username_taken?
    "That name is taken."
  elsif params[:password_1].empty? || params[:password_2].empty?
    "Must fill in password fields."  
  elsif params[:password_1] != params[:password_2]
    "Passwords do not match."
  end
end

def create_image_markdown(url)
  "<title>#{params[:filename]}</title>
  ![alt text](#{url})"
end

def extension_present?
  !!(/\A.+(\..+)\z/.match(params[:filename]))
end

def missing_url?
  params[:url].strip.empty?
end

def upload_error?
  if extension_present?
    extension, others = /\A.+(\..+)\z/.match(params[:filename]).captures
    "#{extension} is not necessary."
  elsif missing_url?
    "The URL was left blank"
  end
end

#Loads the main page.
get "/" do
  erb :index, layout: :layout
end

#Loads new file page.
get "/new" do
  require_signed_in_user
  
  erb :new_doc, layout: :layout
end

#Loads upload image page.
get "/upload" do
  require_signed_in_user

  erb :upload, layout: :layout
end

#Loads the contents of a specific file.
get "/:file_name" do
  file_name = params[:file_name]
  file_path = File.join(data_path, file_name)

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:error] = "#{file_name} does not exist."
    redirect "/"
  end
end

#Loads file edit page.
get "/:file_name/edit" do
  require_signed_in_user

  @file_name = params[:file_name]
  file_path = File.join(data_path, @file_name)

  if File.exist?(file_path)
    @content = File.read(file_path)
    erb :edit, layout: :layout
  else
    session[:error] = "#{file_name} does not exist."
    redirect "/"
  end  
end

#Loads user signin page.
get "/users/signin" do
  erb :login_page, layout: :layout
end

#Loads new user signup page.
get "/users/signup" do
  erb :sign_up, layout: :layout
end

#Creates a new file.
post "/create" do
  require_signed_in_user

  @doc_name = params[:filename].strip

  session[:error] = validate_file_name(@doc_name)
  
  if session[:error]
    session[:error]
    status 422
    erb :new_doc, layout: :layout
  else
    create_document(@doc_name)
    session[:success] = "#{@doc_name} has been created."
    redirect "/"
  end
end

#Deletes a file.
post "/:file_name/delete" do
  require_signed_in_user

  file_name = params[:file_name]
  file_path = File.join(data_path, file_name)

  FileUtils.remove_file(file_path)

  session[:success] = "#{file_name} has been deleted."
  redirect "/"
end

#Loads duplication page.
get "/:file_name/duplicate" do
  require_signed_in_user

  session[:existing_name] = params[:file_name]
  erb :duplicate, layout: :layout
end

#Duplicates a file with a new name.
post "/duplicate" do
  require_signed_in_user

  dup_name = params[:dup_filename]
  session[:error] = validate_file_name(dup_name)

  if session[:error]
    status 422
    erb :duplicate, layout: :layout
  else
    file_path = File.join(data_path, session[:existing_name])
    content = File.read(file_path)
    create_document(dup_name, content)

    session[:success] = "#{session.delete(:existing_name)} has been duplicated as #{dup_name}."
    redirect "/"
  end
end

#Uploads a user submitted image
post "/upload" do
  require_signed_in_user

  session[:error] = upload_error?

  if session[:error]
    status 422
    erb :upload, layout: :layout
  else
    name = "#{params[:filename]}.jpg"
    content = create_image_markdown(params[:url])

    create_document(name,content)
    session[:success] = "Your image was uploaded."
    redirect "/"
  end
end

#Edits an existing file.
post "/:filename" do
  require_signed_in_user

  latest_version = generate_version_number(params[:filename])

  create_document(latest_version, params[:content])

  session[:success] = "#{params[:filename]} has been updated."
  redirect "/"
end

#User signin form.
post "/users/signin" do
  @user_name = params[:username]
  password = params[:password]

  if valid_user?(@user_name, password)
    session[:user] = @user_name
    session[:success] = "Welcome!"
    redirect "/"
  else
    session[:error] = "Invalid credentials."
    status 422
    erb :login_page, layout: :layout
  end
end

#User signup form.
post "/users/signup" do
  session[:error] = signup_errors

  if session[:error]
    status 422
    erb :sign_up, layout: :layout
  else
    create_new_user(params[:username],params[:password_1])
    session[:success] = "Welcome #{params[:username]}!"
    session[:user] = params[:username]
    redirect "/"
  end
end

#User signout form.
post "/users/signout" do
  session.delete(:user)
  session[:error] = "You have been signed out."
  redirect "/"
end
