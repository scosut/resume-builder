before '/education*' do
  unless is_logged_in?
    redirect '/login'
  end
end

get "/education" do
	@user    = User.find(session[:user_id]);
  @schools = @user.schools.all.order(name: :asc)
  erb :"/schools/index"
end

get "/education/new" do
	@school = School.new
	@errors   = []
  erb :"/schools/new"
end

get "/education/edit/:id" do
	@school = School.find(params[:id])
	@errors   = []
  erb :"/schools/edit"
end

post "/education" do
	trim(params)
	@school = School.new(
		name:       params[:name],
		degree:     params[:degree],
		emphasis:   params[:emphasis],
		start_year: params[:start_year],
		end_year:   params[:end_year],
		online:     params[:online].blank? ? false : true
	)	
	@errors = School.validate_input(params)
	
	if (@errors.blank?) then
		@school.user_id = session[:user_id].to_i
		@school.save
		redirect "/education"
	else
		erb :"/schools/new"
	end
end
	
post "/education/edit" do
	trim(params)
	@school            = School.find(params[:schoolId])
	params[:name_old]  = @school.name
	@school.name       = params[:name]
	@school.degree     = params[:degree]
	@school.emphasis   = params[:emphasis]
	@school.start_year = params[:start_year]
	@school.end_year   = params[:end_year]
	@school.online     = params[:online].blank? ? false : true
	@errors            = School.validate_input(params)
	
	if (@errors.blank?) then
		@school.save
		redirect "/education"
	else
		erb :"/schools/edit"
	end
end
	
post "/education/delete" do
	school = School.find(params[:schoolId])
	school.destroy
  redirect "/education"
end