Feature: Manage Problems
	In order to ...
	As an ...
	I want ...

	Background:
	Given a user exists with email "user@test.com" and password "password"
	And a user exists with email "admin@test.com" and password "password"
	And user "admin@test.com" has admin privileges
	And I am not signed in
	And I have gyms named Brooklyn Boulders
	And Brooklyn Boulders has walls named The Beast
	And The Beast has a problem with colors Blue and difficulty V2

	@javascript
	Scenario: Clicking problem when not signed in
	When I go to the wall page for The Beast
	And I click the problem "Blue"
	And I confirm the popup
	Then I should see "Sign in"

	@javascript
	Scenario: Clicking problem when signed in
	When I sign in as "user@test.com/password"
	And I go to the wall page for The Beast
	And I click the problem "Blue"
	And I confirm the popup
	Then I should see "Nice job!"
				
	Scenario: Accessing Wall page as admin
	When I sign in as "admin@test.com/password"
	And I go to the wall page for The Beast
	Then I should see "The Beast"
