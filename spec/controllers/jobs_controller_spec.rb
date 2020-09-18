require 'spec_helper'

describe "Our Jobs Controller" do
  include SpecHelper

  before (:all) do
		@user = User.create(
			name:     "my user", 
			title:    "my title", 
			password: "my password"
		)
		
		post("/login", { name: @user.name, password: "my password" })
		
    @job = @user.jobs.create(
				employer:    "my job employer", 
				title:       "my job title",
				start_year:  Date.today.year,
				end_year:    Date.today.year,
				location:    "my job location",
				description: "my job description"
			)
  end
  
  after (:all) do
		if !@job.destroyed?
			@job.delete
		end
		
		if !@user.destroyed?
			@user.delete
		end
  end
  
  it "responds with a view titled 'Jobs' when we visit /jobs" do
    get("/jobs")
    expect(last_response.body.include?("Jobs")).to be(true)
  end
	
	it "displays a form for adding a job when we visit /jobs/new" do
    get "/jobs/new"
    expect(last_response.body).to include("<form ")
  end
  
  it "displays a page with the job employer when we visit /jobs/edit/:id" do
    get("/jobs/edit/#{@job.id}")
    expect(last_response.body.include?("#{@job.employer}")).to be(true)
  end  
  
  it "creates a job when we post to /jobs" do
    jobs_count = Job.all.count
		new_job    = {
			employer:    "new job employer", 
			title:       "new job title",
			start_year:  Date.today.year,
			end_year:    Date.today.year,
			location:    "new job location",
			description: "new job description"
		}
    post("/jobs", new_job)
    expect(Job.all.count == jobs_count + 1).to eq(true)
		Job.find_by_employer("new job employer").delete
  end
  
  it "edits a job when we post to /jobs/edit" do
    new_job_title = "new job title revised"
		existing_job  = {
			jobId:       @job.id,
			employer:    @job.employer, 
			title:       new_job_title,
			start_year:  @job.start_year,
			end_year:    @job.end_year,
			location:    @job.location,
			description: @job.description
		}
    post("/jobs/edit", existing_job)
    expect(@job.reload.title == new_job_title).to eq(true)
  end
  
  it "deletes a job when we post to /jobs/delete" do
    jobs_count = Job.all.count
    post("/jobs/delete", { jobId: @job.id })
    expect(Job.all.count == jobs_count - 1).to eq(true)
  end
end