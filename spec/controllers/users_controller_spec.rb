require 'spec_helper'

describe "Our Users Controller" do
  include SpecHelper

  before (:all) do
    @user = User.create(
			name:     "my user", 
			title:    "my title", 
			password: "my password"
		)
  end
  
  after (:all) do
    if !@user.destroyed?
      @user.delete
    end
  end
  
  it "responds with a view titled 'Login' when we visit /login" do
    get("/login")
    expect(last_response.body.include?("Login")).to be(true)
  end
	
	it "responds with a view titled 'Register' when we visit /register" do
    get("/register")
    expect(last_response.body.include?("Register")).to be(true)
  end
	
	it "responds with a view titled 'Login' when we visit /logout" do
    get("/logout")
    expect(last_response.body.include?("Login")).to be(true)
  end
	
	it "displays a form for adding a user when we visit /register" do
    get "/register"
    expect(last_response.body).to include("<form ")
  end
	
	it "displays a form for logging in when we visit /login" do
    get "/login"
    expect(last_response.body).to include("<form ")
  end
  
  it "creates a user when we post to /register" do
    users_count = User.all.count
		new_user    = {
			name:     "new user", 
			title:    "new title", 
			password: "new password",
			confirm:  "new password"
		}
    post("/register", new_user)
    expect(User.all.count == users_count + 1).to eq(true)
		User.find_by_name("new user").delete
  end
  
  it "updates a user title when we post to /login" do
    new_title = "new title"
    post("/login", { name: @user.name, title: new_title, password: "my password" })
    expect(@user.reload.title == new_title).to eq(true)
  end
	
	it "stores the logged in user id in session when we post to /login" do
    post("/login", { name: @user.name, password: "my password" })
    expect(session[:user_id].to_i == @user.id).to eq(true)
  end
end