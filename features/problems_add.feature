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
			And I should see "You are not authorized to access this page"

		Scenario: Going to Create Problems page as admin user
			When I sign in as "admin@test.com/password"
			And I go to the new problem page
			Then I should be on the new problem page

		Scenario: Create single color problem
			When I sign in as "admin@test.com/password"
			And I go to the new problem page
			When I select "Blue" from "problem_color_one"
			And I fill in "Difficulty" with "V0"
			And I select "The Beast" from "problem_wall_id"
			And I press "Create Problem"
			Then I should be on the new problem page
			And there is a "V0" problem with colors "Blue" on wall "The Beast"
			And there is a problem named "Blue"
				
		Scenario: Create two color problem
			When I sign in as "admin@test.com/password"
			And I go to the new problem page
			When I select "Blue" from "problem_color_one"
			When I select "White" from "problem_color_two"
			And I fill in "Difficulty" with "V0"
			And I select "The Beast" from "problem_wall_id"
			And I press "Create Problem"
			Then I should be on the new problem page
			And there is a "V0" problem with colors "Blue, White" on wall "The Beast"
			And there is a problem named "Blue & White"
				
		Scenario: Create three color problem
			When I sign in as "admin@test.com/password"
			And I go to the new problem page
			When I select "Blue" from "problem_color_one"
			When I select "Neon Green" from "problem_color_two"
			When I select "Black" from "problem_color_three"
			And I fill in "Difficulty" with "V0"
			And I select "The Beast" from "problem_wall_id"
			And I press "Create Problem"
			Then I should be on the new problem page
			And there is a "V0" problem with colors "Blue, Neon Green, Black" on wall "The Beast"
			And there is a problem named "Blue, Neon Green & Black"
