ENV["RACK_ENV"] = 'test'

require "minitest/autorun"
require 'rack/test'
require 'yaml'

require_relative '../cms.rb'


class AppTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
    create_user_database
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def create_user_database
    user = {admin: "$2a$12$j28tM07A2POF2d66cY83geiNqDcASsoQAUn1cMDCNTspWwqaSnDdK"}
    content = YAML.dump user

    create_document("users.yaml", content)
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    {"rack.session" => {user: "admin"}}
  end

  def test_index
    create_document "about.md"
    create_document "changes.txt"

    get "/"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"

  end


  def test_viewing_text_document
    content = "This is some test content for the .txt file."
    create_document "history.txt", content

    get "/history.txt"

    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, content
  end

  def test_bad_file_request
    get "/bad_file.txt"
    assert_equal 302, last_response.status
    assert_equal "bad_file.txt does not exist.", session[:error]

    get "/"
    assert_nil session[:error]
  end

  def test_viewing_markdown_document
    create_document "sample.md", "# Ruby is ..."

    get "/sample.md"
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Ruby is ...</h1>" 
  end


  def test_view_new_document_form
    get "/new", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_view_new_document_form_signed_out
    get "/new"

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:error]
  end

  def test_create_new_document
    post "/create", {filename: "test.txt"}, admin_session
    assert_equal 302, last_response.status
    assert_equal "test.txt has been created.", session[:success]

    get "/"
    assert_includes last_response.body, "test.txt"
  end

  def test_create_new_document_signed_out
    post "/create", {filename: "test.txt"}

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:error]
  end

  def test_create_new_document_without_filename
    post "/create", {filename: ""}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is required."
  end

  def test_create_new_document_without_extention
    post "/create", {filename: "test"}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "An extension is required."
  end

  def test_create_new_document_with_unsupported_extention
    post "/create", {filename: "test.dox"}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, ".dox is not supported."
  end

  def test_deleting_document
    create_document("test.txt")

    post "/test.txt/delete", {}, admin_session
    assert_equal 302, last_response.status
    assert_equal "test.txt has been deleted.", session[:success]

    get "/"
    refute_includes last_response.body, %q(href="/test.txt")
  end

  def test_deleting_document_signed_out
    create_document("test.txt")

    post "/test.txt/delete"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:error]
  end

  def test_editing_document
    create_document "changes.txt"

    get "/changes.txt/edit", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_editing_document_signed_out
    create_document "changes.txt"

    get "/changes.txt/edit"

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:error]
  end

  def test_updating_document
    post "/changes.txt", {content: "new content"}, admin_session

    assert_equal 302, last_response.status
    assert_equal session[:success], "changes.txt has been updated."

    get last_response.location
    assert_equal 200, last_response.status
    assert_includes last_response.body, "changes_v2.txt"
  end

  def test_updating_document_signed_out
    post "/changes.txt", {content: "new content"}

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:error]
  end

  def test_duplication_signed_out
    get "/changes.txt/duplicate"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:error]
  end

  def test_duplication_signed_in
    get "/changes.txt/duplicate", {}, admin_session

    assert_equal "changes.txt", session[:existing_name]
    assert_includes last_response.body, %q(<form action="/duplicate")
    assert_includes last_response.body, %q(<button type="submit")
    assert_includes last_response.body, "changes_copy(1).txt"
  end

  def test_duplication_form_signed_in
    create_document "changes.txt"

    post "/duplicate", {dup_filename: "changes_copy(1).txt"}, {"rack.session" => {user: "admin", existing_name: "changes.txt"}}
    assert_equal 302, last_response.status

    assert_equal session[:success], "changes.txt has been duplicated as changes_copy(1).txt."
  end

  def test_duplication_form_name_taken
    create_document "changes.txt"

    post "/duplicate", {dup_filename: "changes.txt"}, {"rack.session" => {user: "admin", existing_name: "changes.txt"}}
    assert_equal 422, last_response.status

    assert_includes last_response.body, "That name is taken."
  end

  def test_duplication_form_signed_out
    post "/duplicate", {dup_filename: "changes_copy(1).txt"}
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:error]
  end

  def test_signin_form
    get "/users/signin"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_signin
    post "/users/signin", username: "admin", password: "secret"
    assert_equal 302, last_response.status
    assert_equal "admin", session[:user]
    assert_equal "Welcome!", session[:success]

    get last_response["Location"]
    assert_includes last_response.body, "Signed in as admin"
  end

  def test_signin_with_bad_credentials
    post "/users/signin", username: "guest", password: "shhhh"
    assert_equal 422, last_response.status
    assert_nil session[:user]
    assert_includes last_response.body, "Invalid credentials"
  end

  def test_signout
    post "/users/signin", username: "admin", password: "secret"
    assert_equal "admin", session[:user]

    post "/users/signout"
    refute session[:user]
    assert_equal "You have been signed out.", session[:error]
  end

  def test_create_new_user_page
    get "/users/signup"
    assert_equal 200, last_response.status
    assert_includes last_response.body, %q(<form action="/users/signup" method="post")
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_create_new_user_happy_conditions
    post "/users/signup", {username: "test_usr", password_1: "test", password_2: "test"}
    assert_equal 302, last_response.status
    assert session[:user]
    assert_equal session[:success], "Welcome test_usr!"
  end

  def test_create_new_user_name_taken
    post "/users/signup", {username: "admin", password_1: "test", password_2: "test"}
    assert_equal 422, last_response.status
    assert_includes last_response.body, "That name is taken."
    refute session[:user]
  end

  def test_create_new_user_no_username
    post "/users/signup", {username: "", password_1: "test", password_2: "test"}
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A username is required."
    refute session[:user]
  end

  def test_create_new_user_empty_password
    post "/users/signup", {username: "test_usr", password_1: "", password_2: ""}
    assert_equal 422, last_response.status
    assert_includes last_response.body, "Must fill in password fields."
    refute session[:user]
  end

  def test_create_new_user_passwords_no_match
    post "/users/signup", {username: "test_usr", password_1: "test_1234", password_2: "test"}
    assert_equal 422, last_response.status
    assert_includes last_response.body, "Passwords do not match."
    refute session[:user]
  end

  def test_upload_image_with_extension
    post "/upload", {filename: "image.jpg", url: "https://example.com/"}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "is not necessary"
  end

  def test_upload_image_without_url
    post "/upload", {filename: "image", url: ""}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body,  "The URL was left blank"
  end

  def test_upload_image_happy
    post "/upload", {filename: "image", url: "https://example.com/"}, admin_session
    assert_equal 302, last_response.status
    assert_equal session[:success], "Your image was uploaded."
  end
end