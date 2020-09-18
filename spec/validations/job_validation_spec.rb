require 'spec_helper'

describe "Our Job Validation Methods" do
  include SpecHelper

  it "prevents a user from adding a job without a employer" do
		params = { 
			employer:    nil, 
			title:       nil, 
			start_year:  nil, 
			end_year:    nil, 
			location:    nil, 
			description: nil 
		}
    error = Job.validate_input(params)
    expect(error.include?("Please provide the employer.")).to be(true)
  end
	
	it "prevents a user from adding a job without a title" do
		params = { 
			employer:    nil, 
			title:       nil, 
			start_year:  nil, 
			end_year:    nil, 
			location:    nil, 
			description: nil 
		}
    error = Job.validate_input(params)
    expect(error.include?("Please provide the title.")).to be(true)
  end
	
	it "prevents a user from adding a job without a start year" do
		params = { 
			employer:    nil, 
			title:       nil, 
			start_year:  nil, 
			end_year:    nil, 
			location:    nil, 
			description: nil 
		}
    error = Job.validate_input(params)
    expect(error.include?("Please provide the start year.")).to be(true)
  end
	
	it "prevents a user from adding a job without a valid start year (1900-current year)" do
		params = { 
			employer:    nil, 
			title:       nil, 
			start_year:  1899, 
			end_year:    nil, 
			location:    nil, 
			description: nil 
		}
    error = Job.validate_input(params)
    expect(error.include?("Please provide a valid start year.")).to be(true)
  end
	
	it "prevents a user from adding a job without a end year" do
		params = { 
			employer:    nil, 
			title:       nil, 
			start_year:  nil, 
			end_year:    nil, 
			location:    nil, 
			description: nil 
		}
    error = Job.validate_input(params)
    expect(error.include?("Please provide the end year.")).to be(true)
  end
	
	it "prevents a user from adding a job without a valid end year (1900-current year)" do
		params = { 
			employer:    nil, 
			title:       nil, 
			start_year:  nil, 
			end_year:    1899, 
			location:    nil, 
			description: nil 
		}
    error = Job.validate_input(params)
    expect(error.include?("Please provide a valid end year.")).to be(true)
  end
	
	it "prevents a user from adding a job with an end year that occurs before the start year" do
		params = { 
			employer:    nil, 
			title:       nil, 
			start_year:  2000, 
			end_year:    1999, 
			location:    nil, 
			description: nil 
		}
    error = Job.validate_input(params)
    expect(error.include?("End Year must be &gt;= to Start Year.")).to be(true)
  end
	
	it "prevents a user from adding a job without a location" do
		params = { 
			employer:    nil, 
			title:       nil, 
			start_year:  nil, 
			end_year:    nil, 
			location:    nil, 
			description: nil 
		}
    error = Job.validate_input(params)
    expect(error.include?("Please provide the location.")).to be(true)
  end
	
	it "prevents a user from adding a job without a description" do
		params = { 
			employer:    nil, 
			title:       nil, 
			start_year:  nil, 
			end_year:    nil, 
			location:    nil, 
			description: nil 
		}
    error = Job.validate_input(params)
    expect(error.include?("Please provide the description.")).to be(true)
  end
end