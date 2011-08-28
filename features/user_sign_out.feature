Feature: Sign out
	In order to ...

	Scenario: User signs out
	  Given I am a user with email "user@test.com" and password "password"
		When I sign in as "user@test.com/password"
		Then I should be signed in
		When I sign out
		Then I should see "Signed out"
		When I return next time
		Then I should be signed out
