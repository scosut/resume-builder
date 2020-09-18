module Validate
	def self.authenticate_user(usr, pwd, err, msg)
		if (usr) then
			if (!usr.authenticate(pwd)) then
				err << msg[0]
			end
		else
			err << msg[1]
		end
	end
		
	def self.do_match?(val1, val2, len, err, msg)
		bln = true
		
		if (val1.present? && val1.length >= len && val2.present? && val2.length >= len && val1 != val2) then
			err << msg
			bln = false
		end
			
		bln
	end
	
	def self.get_record_by_column(mdl, val, col, err, msg)
		bln = false
		
		record = mdl.find_by("LOWER(#{col}) = ?", val.to_s.downcase)

		if (record.present?) then
			err << msg if msg.present?
			bln = record
		end
			
		bln
	end
		
	def self.has_length?(val, len, err, msg)
		bln = true
		
		if (val.present? && val.length < len) then
			err << msg
			bln = false
		end
			
		bln
	end
			
	def self.has_value?(val, err, msg)
		bln = true
		
		if (val.blank?) then
			err << msg
			bln = false
		end
			
		bln
	end
		
	def self.is_valid_year?(val, err, msg=nil)
		bln = true
		
		if (val.present?) then
			bln = Integer(val) rescue false
			
			if (bln.is_a? Integer)
				bln = (1900..Date.today.year).include?(bln)
			end
		end
			
		err << msg if msg.present? && bln == false
			
		bln
	end
		
	def self.is_greater_than_or_equal?(val1, val2, err, msg)
		bln = true
		
		if (val1.present? && val2.present?) then
			if (is_valid_year?(val1, err) && is_valid_year?(val2, err)) then
				bln = val2.to_i >= val1.to_i
			end
		end
		
		err << msg if bln == false
		
		bln
	end
end