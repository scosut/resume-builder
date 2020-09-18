get "/login" do
	redirect '/' if is_logged_in?
	@user = User.new
	@errors   = []
  erb :"/users/login"
end

get "/register" do
	redirect '/' if is_logged_in?
	@user = User.new
	@errors   = []
  erb :"/users/register"
end

get "/logout" do
	@user = User.new
	@errors   = []
	session.clear
  erb :"/users/login"
end

get "/guest" do
	@user = User.find_by("LOWER(name) = ?", "guest")
		
	session[:user_id] = @user.id
	redirect "/"
end

post "/login" do
	trim(params)
	@errors = User.validate_login(params)
	
	if (@errors.blank?) then
		@user = User.find_by("LOWER(name) = ?", params[:name].downcase)
		
		if (params[:title].present? && 
			params[:title].downcase != @user.title.downcase) then
			@user.title = params[:title]
			@user.save
		end
			
		session[:user_id] = @user.id
		
		redirect "/"
	else
		@user = User.new(
			name:  params[:name],
			title: params[:title]
		)
		
		erb :"/users/login"
	end
end

post "/register" do
	trim(params)
	@errors = User.validate_registration(params)
	
	if (@errors.blank?) then
		@user = User.new(
			name:     params[:name],
			title:    params[:title],
			password: params[:password]
		)
		
		@user.save
			
		redirect "/login"
	else
		@user = User.new(
			name:     params[:name],
			title:    params[:title],
			password: params[:password]
		)		
		@confirm = params[:confirm]
		
    erb :"/users/register"
	end
end