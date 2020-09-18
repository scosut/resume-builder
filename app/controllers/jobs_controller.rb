before '/jobs*' do
  unless is_logged_in?
    redirect '/login'
  end
end

get "/jobs" do
	@user = User.find(session[:user_id]);
  @jobs = @user.jobs.all.order("employer ASC, title ASC")
  erb :"/jobs/index"
end

get "/jobs/new" do
	@job = Job.new
	@errors   = []
  erb :"/jobs/new"
end

get "/jobs/edit/:id" do
	@job = Job.find(params[:id])
	@errors   = []
  erb :"/jobs/edit"
end

post "/jobs" do
	trim(params)
	@job = Job.new(
		employer:    params[:employer],
		title:       params[:title],
		start_year:  params[:start_year],
		end_year:    params[:end_year],
		location:    params[:location],
		description: params[:description]
	)	
	@errors = Job.validate_input(params)
	
	if (@errors.blank?) then
		@job.user_id = session[:user_id].to_i
		@job.save
		redirect "/jobs"
	else
		erb :"/jobs/new"
	end
end
	
post "/jobs/edit" do
	trim(params)
	@job             = Job.find(params[:jobId])
	@job.employer    = params[:employer]
	@job.title       = params[:title]
	@job.start_year  = params[:start_year]
	@job.end_year    = params[:end_year]
	@job.location    = params[:location]
	@job.description = params[:description]
	@errors          = Job.validate_input(params)
	
	if (@errors.blank?) then
		@job.save
		redirect "/jobs"
	else
		erb :"/jobs/edit"
	end
end
	
post "/jobs/delete" do
	job = Job.find(params[:jobId])
	job.destroy
  redirect "/jobs"
end