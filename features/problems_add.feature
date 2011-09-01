Feature: Add Problems
	  In order to ...
	  As an ...
	  I want ...

		Background:
			Given a user exists with email "user@test.com" and password "password"
			And a user exists with email "admin@test.com" and password "password"
			And user "admin@test.com" has admin privileges
			And I have gyms named Brooklyn Boulders
			And Brooklyn Boulders has walls named The Beast
		
		Scenario: Going to Create Problems page as normal user
			When I sign in as "user@test.com/password"
			And I go to the new problem page
			Then I should be on the home page

		Scenario: Going to Create Problems page as admin user
			When I sign in as "admin@test.com/password"
			And I go to the new problem page
			Then I should be on the new problem page
