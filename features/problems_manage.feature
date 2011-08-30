Feature: Manage Problems
	  In order to ...
	  As an ...
	  I want ...

		Background:
			Given I am a user with email "user@test.com" and password "password"
			And I have gyms named Brooklyn Boulders
			And Brooklyn Boulders has walls named The Beast
			And The Beast has a problem with colors Blue

		@javascript
		Scenario: Clicking problem when not signed in
			Given I am not signed in					
			When I go to the wall page for The Beast
			Then I should see "Blue"
			And I should see "Not logged in"
			When I click the problem "Blue"
			And I click the modal button "Yeah!"
			Then I should see "Sign in"
