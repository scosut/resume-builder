class User < ActiveRecord::Base
	has_secure_password validations: false
	
	has_many :contacts
	has_many :skills
	has_many :jobs
	has_many :projects
	has_many :schools
	
	require_relative "../shared/validate"
	include Validate
	
	def self.validate_login(params)
		errors = []
		
		Validate::has_value?(
			params[:name], 
			errors, 
			"Please provide the name."
		)
		
		Validate::has_value?(
			params[:password], 
			errors, 
			"Please provide the password."
		)
			
		if (errors.blank?) then
			user = Validate::get_record_by_column(
				self,
				params[:name], 
				"name", 
				errors, 
				nil
			)
			
			Validate::authenticate_user(
				user, 
				params[:password], 
				errors, 
				[
					"Please enter the correct password.",
					"User '#{params[:name]}' does not exist."
				]
			)			
		end
			
		errors
  end
			
	def self.validate_registration(params)
		errors = []
		
		Validate::has_value?(
			params[:name], 
			errors, 
			"Please provide the name."
		)
		
		user = Validate::get_record_by_column(
			self,
			params[:name], 
			"name", 
			errors, 
			"User '#{params[:name]}' already exists."
		)
		
		Validate::has_value?(
			params[:title], 
			errors, 
			"Please provide the title."
		)
			
		Validate::has_value?(
			params[:password], 
			errors, 
			"Please provide the password."
		)
			
		Validate::has_length?(
			params[:password], 
			6, 
			errors, 
			"Password must contain 6 or more characters."
		)
			
		Validate::has_value?(
			params[:confirm], 
			errors, 
			"Please confirm the password."
		)
			
		Validate::has_length?(
			params[:confirm], 
			6, 
			errors, 
			"Confirmation Password must contain 6 or more characters."
		)
		
		Validate::do_match?(
			params[:password],
			params[:confirm],
			6,
			errors,
			"Password and Confirm Password must match."
		)
		
		errors
  end
end