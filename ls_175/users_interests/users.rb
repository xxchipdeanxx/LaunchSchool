require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'


before do
  @users = Psych.load_file("data/users.yaml")
end

helpers do
  def show_interests(name)
    @users[name][:interests].join(", ")
  end

  def select_other_users(current_user)
    @other_users = @users.select {|name, _| current_user != name }
  end

  def count_interests
    total_interests = 0
    each_user do |name, email, interests|
      total_interests += interests.size
    end
    total_interests
  end
end

def each_user(user_list = @users)
  user_list.each do |user, info|
    name = user
    email = info[:email]
    interests = info[:interests]

    yield(name, email, interests)
  end
end

not_found do
  redirect "/"
end

get "/" do
  erb :home
end

get "/user/:user" do
  @name = params[:user].to_sym
  @user = @users[@name]
  erb :user
end
