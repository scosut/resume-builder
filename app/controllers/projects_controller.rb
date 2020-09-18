before '/projects*' do
  unless is_logged_in?
    redirect '/login'
  end
end

get "/projects" do
	@user     = User.find(session[:user_id]);
  @projects = @user.projects.all.order(title: :asc)
  erb :"/projects/index"
end

get "/projects/new" do
	@project = Project.new
	@errors   = []
  erb :"/projects/new"
end

get "/projects/edit/:id" do
	@project = Project.find(params[:id])
	@errors   = []
  erb :"/projects/edit"
end

post "/projects" do
	trim(params)
	@project = Project.new(
		title:       params[:title],
		year:        params[:year],
		description: params[:description]
	)	
	@errors = Project.validate_input(params)
	
	if (@errors.blank?) then
		@project.user_id = session[:user_id].to_i
		@project.save
		redirect "/projects"
	else
		erb :"/projects/new"
	end
end
	
post "/projects/edit" do
	trim(params)
	@project             = Project.find(params[:projectId])
	params[:title_old]   = @project.title
	@project.title       = params[:title]
	@project.year        = params[:year]
	@project.description = params[:description]
	@errors              = Project.validate_input(params)
	
	if (@errors.blank?) then
		@project.save
		redirect "/projects"
	else
		erb :"/projects/edit"
	end
end
	
post "/projects/delete" do
	project = Project.find(params[:projectId])
	project.destroy
  redirect "/projects"
end