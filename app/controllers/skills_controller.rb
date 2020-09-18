before '/skills*' do
  unless is_logged_in?
    redirect '/login'
  end
end

get "/skills" do
	@user   = User.find(session[:user_id]);
  @skills = @user.skills.all.order(name: :asc)
  erb :"/skills/index"
end

get "/skills/new" do
	@skill = Skill.new
	@errors   = []
  erb :"/skills/new"
end

get "/skills/edit/:id" do
	@skill = Skill.find(params[:id])
	@errors   = []
  erb :"/skills/edit"
end

post "/skills" do
	trim(params)
	@skill  = Skill.new(name: params[:name])
	@errors = Skill.validate_input(params)
	
	if (@errors.blank?) then
		@skill.user_id = session[:user_id].to_i
		@skill.save
		redirect "/skills"
	else
		erb :"/skills/new"
	end
end
	
post "/skills/edit" do
	trim(params)
	@skill      = Skill.find(params[:skillId])	
	params[:name_old] = @skill.name
	@skill.name = params[:name]
	@errors     = Skill.validate_input(params)
	
	if (@errors.blank?) then
		@skill.save
		redirect "/skills"
	else
		erb :"/skills/edit"
	end
end
	
post "/skills/delete" do
	skill = Skill.find(params[:skillId])
	skill.destroy
  redirect "/skills"
end