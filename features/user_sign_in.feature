Feature: Sign in
  In order to ...
	A user ...
	should be able to ...

		Scenario: User is not signed up
			Given I am not signed in
			And no user exists with an email of "user@test.com"
			When I go to the sign in page
			And I sign in as "user@test.com/password"
			Then I should see "Invalid email or password."
			And I go to the home page
			And I should be signed out

		Scenario: User enters wrong password
			Given I am not signed in
			And I am a user with email "user@test.com" and password "password"
			When I go to the sign in page
			And I sign in as "user@test.com/wrongpassword"
			Then I should see "Invalid email or password."
			And I should be signed out

		Scenario: User signs in sucessfully
			Given I am not signed in
			And I am a user with email "user@test.com" and password "password"
			When I go to the sign in page
			And I sign in as "user@test.com/password"
			Then I should see "Signed in successfully."
			And I should be signed in
			When I return next time
			Then I should be already signed in
