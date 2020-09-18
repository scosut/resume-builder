class School < ActiveRecord::Base
	belongs_to :user
	
	require_relative "../shared/validate"
	include Validate
	
	def self.validate_input(params)
		errors = []
		
		new_name = params[:name]
		old_name = params[:name_old]
		
		Validate::has_value?(
			new_name, 
			errors, 
			"Please provide the name."
		)
		
		if (old_name.blank? || (old_name.present? && new_name.downcase != old_name.downcase)) then
			Validate::get_record_by_column(
				self,
				new_name,
				"name",
				errors,
				"Institution '#{new_name}' already exists."
			)
		end
		
		Validate::has_value?(
			params[:emphasis], 
			errors, 
			"Please provide the emphasis."
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
		
		errors
  end
end