Feature: timesheet access and editing

	As a user
	I want access and edit my timesheets
	So that I can bill clients and make money

	Scenario: Viewing current time sheet
		Given there exists a user named "frank"
		And I am on the homepage
		When I follow "frank"
		Then I should see the current timesheet
	
	Scenario: Viewing entries to current timesheet
		Given there exists a user named "frank"
		When frank adds a new entry for 4 hours on the "PAS" project doing "Development" with the description "Coding Stuff"
		And I am viewing the current timesheet for "frank"
		Then the "user_entries_attributes_0_project" field should be "PAS"
		
	Scenario: Viewing next time sheet
		Given there exists a user named "frank"
		And I am viewing the current timesheet for "frank"
		When I follow "Next TimeSheet"
		Then I should see next weeks timesheet
		
	Scenario: Viewing previous time sheet
		Given there exists a user named "frank"
		And I am viewing the current timesheet for "frank"
		When I follow "Previous TimeSheet"
		Then I should see the previous weeks timesheet