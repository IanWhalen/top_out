Feature: Add Problems

		Background:
			Given a user exists with email "user@test.com" and password "password"
			And a user exists with email "admin@test.com" and password "password"
			And user "admin@test.com" has admin privileges
			And I have gyms named Brooklyn Boulders
		
		Scenario: Going to Create Walls page as normal user
			When I sign in as "user@test.com/password"
			And I go to the new wall page
			Then I should be on the home page
			And I should see "You are not authorized to access this page"

		Scenario: Going to Create Walls page as admin user
			When I sign in as "admin@test.com/password"
			And I go to the new wall page
			Then I should be on the new wall page

		Scenario: Create new wall
			When I sign in as "admin@test.com/password"
			And I go to the new wall page
			When I select "Brooklyn Boulders" from "wall_gym_id"
			And I fill in "Name" with "The Beast"
			And I fill in "Height" with "30"
			And I press "Create Wall"
			Then I should be on the new wall page
			And there is a wall named "The Beast"
