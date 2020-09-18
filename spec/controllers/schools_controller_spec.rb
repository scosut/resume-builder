require 'spec_helper'

describe "Our Schools Controller" do
  include SpecHelper

  before (:all) do
		@user = User.create(
			name:     "my user", 
			title:    "my title", 
			password: "my password"
		)
		
		post("/login", { name: @user.name, password: "my password" })
		
    @school = @user.schools.create(
			name:       "my school name",
			degree:     "my school degree",
			emphasis:   "my school emphasis",
			start_year: Date.today.year,
			end_year:   Date.today.year,
			online:     false
		)
  end
  
  after (:all) do
		if !@school.destroyed?
			@school.delete
		end
		
		if !@user.destroyed?
			@user.delete
		end
  end
  
  it "responds with a view titled 'Education' when we visit /education" do
    get("/education")
    expect(last_response.body.include?("Education")).to be(true)
  end
	
	it "displays a form for adding a school when we visit /education/new" do
    get "/education/new"
    expect(last_response.body).to include("<form ")
  end
  
  it "displays a page with the school name when we visit /education/edit/:id" do
    get("/education/edit/#{@school.id}")
    expect(last_response.body.include?("#{@school.name}")).to be(true)
  end  
  
  it "creates a school when we post to /education" do
    schools_count = School.all.count
		new_school    = {
			name:       "new school name",
			degree:     "new school degree",
			emphasis:   "new school emphasis",
			start_year: Date.today.year,
			end_year:   Date.today.year,
			online:     false
		}
    post("/education", new_school)
    expect(School.all.count == schools_count + 1).to eq(true)
		School.find_by_name("new school name").delete
  end
  
  it "edits a school when we post to /education/edit" do
    new_school_name = "new school name revised"
		existing_school = {
			schoolId:   @school.id,
			name:       new_school_name, 
			degree:     @school.degree,
			emphasis:   @school.emphasis,
			start_year: @school.start_year,
			end_year:   @school.end_year,
			online:     @school.online
		}
    post("/education/edit", existing_school)
    expect(@school.reload.name == new_school_name).to eq(true)
  end
  
  it "deletes a school when we post to /education/delete" do
    schools_count = School.all.count
    post("/education/delete", { schoolId: @school.id })
    expect(School.all.count == schools_count - 1).to eq(true)
  end
end