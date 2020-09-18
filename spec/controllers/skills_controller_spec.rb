require 'spec_helper'

describe "Our Skills Controller" do
  include SpecHelper

  before (:all) do
		@user = User.create(
			name:     "my user", 
			title:    "my title", 
			password: "my password"
		)
		
		post("/login", { name: @user.name, password: "my password" })
		
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
  
  it "responds with a view titled 'Skills' when we visit /skills" do
    get("/skills")
    expect(last_response.body.include?("Skills")).to be(true)
  end
	
	it "displays a form for adding a skill when we visit /skills/new" do
    get "/skills/new"
    expect(last_response.body).to include("<form ")
  end
  
  it "displays a page with the skill name when we visit /skills/edit/:id" do
    get("/skills/edit/#{@skill.id}")
    expect(last_response.body.include?("#{@skill.name}")).to be(true)
  end  
  
  it "creates a skill when we post to /skills" do
    skills_count = Skill.all.count
    post("/skills", { name: "new skill name" })
    expect(Skill.all.count == skills_count + 1).to eq(true)
		Skill.find_by_name("new skill name").delete
  end
  
  it "edits a skill when we post to /skills/edit" do
    new_skill_name = "new skill name revised"
    post("/skills/edit", { skillId: @skill.id, name: new_skill_name })
    expect(@skill.reload.name == new_skill_name).to eq(true)
  end
  
  it "deletes a skill when we post to /skills/delete" do
    skills_count = Skill.all.count
    post("/skills/delete", { skillId: @skill.id })
    expect(Skill.all.count == skills_count - 1).to eq(true)
  end
end