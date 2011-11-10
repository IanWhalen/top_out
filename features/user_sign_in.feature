Feature: Sign in
  In order to ...
	A user ...
	should be able to ...

		Background: 
			Given I am not signed in

		Scenario: User is not signed up
			Given no user exists with email "user@test.com"
			When I go to the sign in page
			And I sign in as "user@test.com/password"
			Then I should see "Invalid email or password."
			And I go to the home page
			And I should be signed out

		Scenario: User enters wrong password
			Given a user exists with email "user@test.com" and password "password"
			When I go to the sign in page
			And I sign in as "user@test.com/wrongpassword"
			Then I should see "Invalid email or password."
			And I should be signed out

		Scenario: User signs in sucessfully
			Given a user exists with email "user@test.com" and password "password"
			When I go to the sign in page
			And I sign in as "user@test.com/password"
			Then I should be signed in
			When I return next time
			Then I should be already signed in
