class Skill < ActiveRecord::Base
	belongs_to :user
	
	require_relative "../shared/validate"
	include Validate
	
	def self.validate_input(params)
		errors = []
		
		new_name = params[:name]
		old_name = params[:name_old]
		
		Validate::has_value?(
			params[:name], 
			errors, 
			"Please provide the name."
		)
		
		
		if (old_name.blank? || (old_name.present? && new_name.downcase != old_name.downcase)) then
			Validate::get_record_by_column(
				self,
				new_name,
				"name",
				errors,
				"Skill '#{new_name}' already exists."
			)
		end
		
		errors
  end
end