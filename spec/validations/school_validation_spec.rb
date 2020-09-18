require 'spec_helper'

describe "Our School Validation Methods" do
  include SpecHelper

  before (:all) do
		@user = User.create(
			name:     "my user", 
			title:    "my title", 
			password: "my password"
		)
		
		@school = @user.schools.create(
			name:       "my school name",
			degree:     "my school degree",
			emphasis:   "my school emphasis",
			start_year: Date.today.year,
			end_year:   Date.today.year,
			online:     false
		)
  end
  
  after (:all) do
		if !@school.destroyed?
      @school.delete
    end
		
		if !@user.destroyed?
      @user.delete
    end
  end
	
  it "prevents a user from adding a school without a name" do
		params = { 
			name:       nil, 
			degree:     nil, 
			emphasis:   nil, 
			start_year: nil, 
			end_year:   nil, 
			online:     nil
		}
    error  = School.validate_input(params)
    expect(error.include?("Please provide the name.")).to be(true)
  end
	
	it "prevents a user from adding a school with a name that already exists" do
		params = { 
			name:       "my school name", 
			degree:     nil, 
			emphasis:   nil, 
			start_year: nil, 
			end_year:   nil, 
			online:     nil
		}
    error  = School.validate_input(params)
    expect(error.include?("Institution '#{params[:name]}' already exists.")).to be(true)
  end
	
	it "prevents a user from adding a school without emphasis" do
		params = { 
			name:       nil, 
			degree:     nil, 
			emphasis:   nil, 
			start_year: nil, 
			end_year:   nil, 
			online:     nil
		}
    error  = School.validate_input(params)
    expect(error.include?("Please provide the emphasis.")).to be(true)
  end
	
	it "prevents a user from adding a school without the end year" do
		params = { 
			name:       nil, 
			degree:     nil, 
			emphasis:   nil, 
			start_year: nil, 
			end_year:   nil, 
			online:     nil
		}
    error  = School.validate_input(params)
    expect(error.include?("Please provide the end year.")).to be(true)
  end
	
	it "prevents a user from adding a school without a valid end year (1900-current year)" do
		params = { 
			name:       nil, 
			degree:     nil, 
			emphasis:   nil, 
			start_year: nil, 
			end_year:   1899, 
			online:     nil
		}
    error  = School.validate_input(params)
    expect(error.include?("Please provide a valid end year.")).to be(true)
  end
	
	it "prevents a user from adding a school with an end year that occurs before the start year" do
		params = { 
			name:       nil, 
			degree:     nil, 
			emphasis:   nil, 
			start_year: 2000, 
			end_year:   1999, 
			online:     nil
		}
    error  = School.validate_input(params)
    expect(error.include?("End Year must be &gt;= to Start Year.")).to be(true)
  end
end