require 'spec_helper'

describe "Our Skill Validation Methods" do
  include SpecHelper

  before (:all) do
		@user = User.create(
			name:     "my user", 
			title:    "my title", 
			password: "my password"
		)
		
		@skill = @user.skills.create(name: "my skill name")
  end
  
  after (:all) do
		if !@skill.destroyed?
      @skill.delete
    end
		
		if !@user.destroyed?
      @user.delete
    end
  end
	
  it "prevents a user from adding a skill without a name" do
		params = { name: nil }
    error  = Skill.validate_input(params)
    expect(error.include?("Please provide the name.")).to be(true)
  end
	
	it "prevents a user from adding a skill with a name that already exists" do
		params = { name: "my skill name" }
    error  = Skill.validate_input(params)
    expect(error.include?("Skill '#{params[:name]}' already exists.")).to be(true)
  end
end