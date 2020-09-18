class Job < ActiveRecord::Base
	belongs_to :user
	
	require_relative "../shared/validate"
	include Validate
	
	def self.validate_input(params)
		errors = []
		
		Validate::has_value?(
			params[:employer], 
			errors, 
			"Please provide the employer."
		)
		
		Validate::has_value?(
			params[:title], 
			errors, 
			"Please provide the title."
		)
		
		Validate::has_value?(
			params[:start_year], 
			errors, 
			"Please provide the start year."
		)
		
		Validate::is_valid_year?(
			params[:start_year],
			errors,
			"Please provide a valid start year."
		)
		
		Validate::has_value?(
			params[:end_year], 
			errors, 
			"Please provide the end year."
		)
		
		Validate::is_valid_year?(
			params[:end_year],
			errors,
			"Please provide a valid end year."
		)
		
		Validate::is_greater_than_or_equal?(
			params[:start_year],
			params[:end_year],
			errors,
			"End Year must be &gt;= to Start Year."
		)
		
		Validate::has_value?(
			params[:location], 
			errors, 
			"Please provide the location."
		)
		
		Validate::has_value?(
			params[:description], 
			errors, 
			"Please provide the description."
		)
		
		errors
  end
end