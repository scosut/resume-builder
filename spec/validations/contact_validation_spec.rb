require 'spec_helper'

describe "Our Contact Validation Methods" do
  include SpecHelper

  before (:all) do
		@user = User.create(
			name:     "my user", 
			title:    "my title", 
			password: "my password"
		)
		
		@contact = @user.contacts.create(
			title: "my contact title",
			value: "my contact value"
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
	
  it "prevents a user from adding a contact without a title" do
		params = { title: nil, value: nil }
    error = Contact.validate_input(params)
    expect(error.include?("Please provide the title.")).to be(true)
  end
	
	it "prevents a user from adding a contact without a value" do
		params = { title: nil, value: nil }
    error = Contact.validate_input(params)
    expect(error.include?("Please provide the value.")).to be(true)
  end
	
	it "prevents a user from adding a contact that already exists" do
		params = { title: 'my contact title', value: nil }
    error = Contact.validate_input(params)
    expect(error.include?("Contact '#{params[:title]}' already exists.")).to be(true)
  end
end