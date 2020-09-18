module ApplicationHelper
	def is_logged_in?
		session.key?(:user_id)
	end
	
	def trim(hsh)
		hsh.each_value do |v|
			v.strip!
			v.gsub!(/\s+/, ' ')
		end

		hsh
	end
end
