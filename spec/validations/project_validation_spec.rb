require 'spec_helper'

describe "Our Project Validation Methods" do
  include SpecHelper

  before (:all) do
		@user = User.create(
			name:     "my user", 
			title:    "my title", 
			password: "my password"
		)
		
		@project = @user.projects.create(
			title:       "my project title",
			year:        Date.today.year,
			description: "my project description"
		)
  end
  
  after (:all) do
		if !@project.destroyed?
      @project.delete
    end
		
		if !@user.destroyed?
      @user.delete
    end
  end
	
  it "prevents a user from adding a project without a title" do
		params = { title: nil, year: nil, description: nil }
    error  = Project.validate_input(params)
    expect(error.include?("Please provide the title.")).to be(true)
  end
	
	it "prevents a user from adding a project with a title that already exists" do
		params = { title: 'my project title', year: nil, description: nil }
    error  = Project.validate_input(params)
    expect(error.include?("Project '#{params[:title]}' already exists.")).to be(true)
  end
	
	it "prevents a user from adding a project without a year" do
		params = { title: nil, year: nil, description: nil }
    error  = Project.validate_input(params)
    expect(error.include?("Please provide the year.")).to be(true)
  end
	
	it "prevents a user from adding a project without a valid year (1900-current year)" do
		params = { title: nil, year: 1899, description: nil }
    error  = Project.validate_input(params)
    expect(error.include?("Please provide a valid year.")).to be(true)
  end
	
	it "prevents a user from adding a project without a description" do
		params = { title: nil, year: 1899, description: nil }
    error = Project.validate_input(params)
    expect(error.include?("Please provide the description.")).to be(true)
  end
end