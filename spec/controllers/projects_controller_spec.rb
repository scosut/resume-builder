require 'spec_helper'

describe "Our Projects Controller" do
  include SpecHelper

  before (:all) do
		@user = User.create(
			name:     "my user", 
			title:    "my title", 
			password: "my password"
		)
		
		post("/login", { name: @user.name, password: "my password" })
		
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
  
  it "responds with a view titled 'Projects' when we visit /projects" do
    get("/projects")
    expect(last_response.body.include?("Projects")).to be(true)
  end
	
	it "displays a form for adding a project when we visit /projects/new" do
    get "/projects/new"
    expect(last_response.body).to include("<form ")
  end
  
  it "displays a page with the project title when we visit /projects/edit/:id" do
    get("/projects/edit/#{@project.id}")
    expect(last_response.body.include?("#{@project.title}")).to be(true)
  end  
  
  it "creates a project when we post to /projects" do
    projects_count = Project.all.count
		new_project    = {
			title:       "new project title",
			year:        Date.today.year,
			description: "new project description"
		}
    post("/projects", new_project)
    expect(Project.all.count == projects_count + 1).to eq(true)
		Project.find_by_title("new project title").delete
  end
  
  it "edits a project when we post to /projects/edit" do
    new_project_title = "new project title revised"
		existing_project  = {
			projectId:   @project.id,
			title:       new_project_title,
			year:        @project.year,
			description: @project.description
		}
    post("/projects/edit", existing_project)
    expect(@project.reload.title == new_project_title).to eq(true)
  end
  
  it "deletes a project when we post to /projects/delete" do
    projects_count = Project.all.count
    post("/projects/delete", { projectId: @project.id })
    expect(Project.all.count == projects_count - 1).to eq(true)
  end
end