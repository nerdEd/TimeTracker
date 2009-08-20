Feature: User Administration

	As a user
	I want to be able to administer users
	So that I can enter time
	
	Scenario: View listing of users
		Given there exists a user named "frank"
		And there exists a user named "jen"
		When I am on the homepage
		Then I should see "frank"
		And I should see "jen"

	Scenario: Adding new user
		Given I go to the new user page
		When I fill in "name" with "jen"
		And I press "Create"
		Then I should be on the users page
		And I should see "jen"