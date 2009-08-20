Given /^there exists a user named "(.+)"$/ do | user_name |
  User.create( :name => user_name )
end

When /^(.+) adds a new entry for ([\d]) hours on the "([^\"]*)" project doing "([^\"]*)" with the description "([^\"]*)"$/ do | user, hours, project, activity, description |
  user = User.find_by_name( user )
  Entry.new( :user_id => user.id, :hours => hours, :project => project, :activity => activity, :description => description, :date => Date.today ).save
end

Then /^I should see the current timesheet$/ do  
  check_timesheet( 0 )
end

Then /^I should see next weeks timesheet$/ do  
  check_timesheet( 1 )
end

Then /^I should see the previous weeks timesheet$/ do
  check_timesheet( -1 )
end

def check_timesheet( weeks_from )
  today = Date.today + ( 7 * weeks_from )
  start_day = ( today - today.wday )
  end_day = ( start_day + 6 )
  response.should contain "TimeSheet for #{start_day.to_s} to #{end_day.to_s}"
end

Given /^I am viewing the current timesheet for "([^\"]*)"$/ do | user_name |  
    user = User.find_by_name( user_name )
    visit edit_timesheet_user_path( user )
end

Then /^the "([^\"]*)" field should be "([^\"]*)"$/ do | field_id, value |
  field_with_id( field_id ).value.should == value
end