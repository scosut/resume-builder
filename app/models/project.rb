class Project < ActiveRecord::Base
	belongs_to :user
	
	require_relative "../shared/validate"
	include Validate
	
	def self.validate_input(params)
		errors = []
		
		new_title = params[:title]
		old_title = params[:title_old]
		
		Validate::has_value?(
			new_title, 
			errors, 
			"Please provide the title."
		)
		
		if (old_title.blank? || (old_title.present? && new_title.downcase != old_title.downcase)) then
			Validate::get_record_by_column(
				self,
				new_title,
				"title",
				errors,
				"Project '#{new_title}' already exists."
			)
		end
		
		Validate::has_value?(
			params[:year], 
			errors, 
			"Please provide the year."
		)
		
		Validate::is_valid_year?(
			params[:year],
			errors,
			"Please provide a valid year."
		)
		
		Validate::has_value?(
			params[:description], 
			errors, 
			"Please provide the description."
		)
		
		errors
  end
end