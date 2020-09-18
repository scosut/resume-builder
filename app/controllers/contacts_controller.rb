before '/contacts*' do
  unless is_logged_in?
    redirect '/login'
  end
end

get "/contacts" do
	@user     = User.find(session[:user_id]);
  @contacts = @user.contacts.order(title: :asc)
  erb :"/contacts/index"
end

get "/contacts/new" do
	@contact = Contact.new
	@errors   = []
  erb :"/contacts/new"
end

get "/contacts/edit/:id" do
	@contact = Contact.find(params[:id])
	@errors   = []
  erb :"/contacts/edit"
end

post "/contacts" do
	trim(params)
	@contact = Contact.new(title: params[:title], value: params[:value])
	@errors  = Contact.validate_input(params)
	
	if (@errors.blank?) then
		@contact.user_id = session[:user_id].to_i
		@contact.save
		redirect "/contacts"
	else
		erb :"/contacts/new"
	end
end
	
post "/contacts/edit" do
	trim(params)
	@contact = Contact.find(params[:contactId])
	params[:title_old] = @contact.title
	@contact.title = params[:title]
	@contact.value = params[:value]
	@errors        = Contact.validate_input(params)
	
	if (@errors.blank?) then
		@contact.save
		redirect "/contacts"
	else
		erb :"/contacts/edit"
	end
end
	
post "/contacts/delete" do
	contact = Contact.find(params[:contactId])
	contact.destroy
  redirect "/contacts"
end