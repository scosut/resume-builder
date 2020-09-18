require 'spec_helper'

describe "Our User Validation Methods" do
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
	
  it "prevents a user from registering without a name" do
		params = { name: nil, title: nil, password: nil, confirm: nil }
    error = User.validate_registration(params)
    expect(error.include?("Please provide the name.")).to be(true)
  end
	
	it "prevents a user from registering without a title" do
		params = { name: nil, title: nil, password: nil, confirm: nil }
    error = User.validate_registration(params)
    expect(error.include?("Please provide the title.")).to be(true)
  end
	
	it "prevents a user from registering without a password" do
		params = { name: nil, title: nil, password: nil, confirm: nil }
    error = User.validate_registration(params)
    expect(error.include?("Please provide the password.")).to be(true)
  end
	
	it "requires the user provide a password with 6+ characters to register" do
		params = { name: nil, title: nil, password: '12345', confirm: nil }
    error = User.validate_registration(params)
    expect(error.include?("Password must contain 6 or more characters.")).to be(true)
  end
	
	it "prevents a user from registering without confirming the password" do
		params = { name: nil, title: nil, password: nil, confirm: nil }
    error = User.validate_registration(params)
    expect(error.include?("Please confirm the password.")).to be(true)
  end
	
	it "requires the user provide a confirmation password with 6+ characters to register" do
		params = { name: nil, title: nil, password: nil, confirm: '12345' }
    error = User.validate_registration(params)
    expect(error.include?("Confirmation Password must contain 6 or more characters.")).to be(true)
  end
	
	it "requires the user provide a confirmation password that matches the password to register" do
		params = { name: nil, title: nil, password: '123456', confirm: '234567' }
    error = User.validate_registration(params)
    expect(error.include?("Password and Confirm Password must match.")).to be(true)
  end
	
	it "prevents a user from registering with a name that already exists" do
		params = { name: 'my user', title: nil, password: nil, confirm: nil }
    error = User.validate_registration(params)
    expect(error.include?("User '#{params[:name]}' already exists.")).to be(true)
  end
	
	it "prevents a user from logging in without a name" do
		params = { name: nil, title: nil, password: nil }
    error = User.validate_login(params)
    expect(error.include?("Please provide the name.")).to be(true)
  end
	
	it "prevents a user from logging in without a password" do
		params = { name: nil, title: nil, password: nil }
    error = User.validate_login(params)
    expect(error.include?("Please provide the password.")).to be(true)
  end
	
	it "prevents a user from logging in without a valid username" do
		params = { name: 'my user 2', title: nil, password: 'my password' }
    error = User.validate_login(params)
    expect(error.include?("User '#{params[:name]}' does not exist.")).to be(true)
  end
	
	it "prevents a user from logging in without the correct password" do
		params = { name: 'my user', title: nil, password: '123456' }
    error = User.validate_login(params)
    expect(error.include?("Please enter the correct password.")).to be(true)
  end	
end