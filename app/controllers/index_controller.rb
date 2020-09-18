get "/" do
  erb :index
end

get "/resume" do
	redirect '/login' if !is_logged_in?
	@user     = User.find(session[:user_id]);
  @contacts = @user.contacts.order(title: :asc)
	@skills   = @user.skills.order(name: :asc)
	@jobs     = @user.jobs.order(end_year: :desc)
	@projects = @user.projects.order(year: :desc)
	@schools  = @user.schools.order(end_year: :desc)
  erb :"/resume/index"
end