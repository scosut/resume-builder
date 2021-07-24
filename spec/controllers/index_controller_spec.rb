require 'spec_helper'

describe "Our Index Controller" do
  include SpecHelper
	
	before (:all) do
		@user = User.create(
			name:     "my user", 
			title:    "my title", 
			password: "my password"
		)
		
		post("/login", { name: @user.name, password: "my password" })
  end
  
  after (:all) do
		if !@user.destroyed?
			@user.delete
		end
  end

  it "responds with a view titled 'Home' when we visit /" do
    get("/")
    expect(last_response.body.include?("Home")).to be(true)
  end
	
	it "responds with a view titled 'R&eacute;sum&eacute;' when we visit /resume" do
    get("/resume")
    expect(last_response.body.include?("R&eacute;sum&eacute;")).to be(true)
  end
end