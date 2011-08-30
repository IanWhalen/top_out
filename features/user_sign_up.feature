Feature: Sign Up
  In order to ...
  As an ...
  I want ...

    Background:
      Given I am not signed in
      And I am on the home page
      And I go to the sign up page

    Scenario: User signs up with valid data
      When I fill in the following:
				|Email			|user@test.com	|
				|Password		|password	|
				|Password confirmation	|password	|
      And I press "Sign up"
      Then I should see "Welcome! You have signed up successfully."

    Scenario: User signs up with invalid email
      When I fill in the following:
				|Email			|invalidemail	|
				|Password		|password	|
				|Password confirmation	|password	|
      And I press "Sign up"
      Then I should see "Email is invalid"

    Scenario: User signs up without password
      When I fill in the following:
				|Email			|user@test.com	|
				|Password		|		|
				|Password confirmation	|password	|
      And I press "Sign up"
      Then I should see "Password can't be blank"

    Scenario: User signs up with password confirmation
      When I fill in the following:
				|Email			|user@test.com	|
				|Password		|password	|
				|Password confirmation	|		|
      And I press "Sign up"
      Then I should see "Password doesn't match confirmation"
    
    Scenario: User signs up with mismatched password and confirmation
      When I fill in the following:
				|Email			|user@test.com	|
				|Password		|password	|
				|Password confirmation	|password1	|
      And I press "Sign up"
      Then I should see "Password doesn't match confirmation"
