require 'spec_helper'

describe "Our Contacts Controller" do
  include SpecHelper

  before (:all) do
		@user = User.create(
			name:     "my user", 
			title:    "my title", 
			password: "my password"
		)
		
		post("/login", { name: @user.name, password: "my password" })
		
    @contact = @user.contacts.create(
			title: "my contact title", 
			value: "my contact value", 
		)
  end
  
  after (:all) do
		if !@contact.destroyed?
			@contact.delete
		end
		
		if !@user.destroyed?
			@user.delete
		end
  end
  
  it "responds with a view titled 'Contacts' when we visit /contacts" do
    get("/contacts")
    expect(last_response.body.include?("Contacts")).to be(true)
  end
	
	it "displays a form for adding a contact when we visit /contacts/new" do
    get "/contacts/new"
    expect(last_response.body).to include("<form ")
  end
  
  it "displays a page with the contact title when we visit /contacts/edit/:id" do
    get("/contacts/edit/#{@contact.id}")
    expect(last_response.body.include?("#{@contact.title}")).to be(true)
  end  
  
  it "creates a contact when we post to /contacts" do
    contacts_count = Contact.all.count
    post("/contacts", { title: "new contact title", value: "new contact value" })
    expect(Contact.all.count == contacts_count + 1).to eq(true)
		Contact.find_by_title("new contact title").delete
  end
  
  it "edits a contact when we post to /contacts/edit" do
    new_contact_value = "new contact value revised"
    post("/contacts/edit", { contactId: @contact.id, title: @contact.title, value: new_contact_value })
    expect(@contact.reload.value == new_contact_value).to eq(true)
  end
  
  it "deletes a contact when we post to /contacts/delete" do
    contacts_count = Contact.all.count
    post("/contacts/delete", { contactId: @contact.id })
    expect(Contact.all.count == contacts_count - 1).to eq(true)
  end
end