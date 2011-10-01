Feature: Manage Problems
	In order to ...
	As an ...
	I want ...

	Background:
	Given I have gyms named Brooklyn Boulders
	And Brooklyn Boulders has walls named The Beast
	And The Beast has a problem with colors Blue and difficulty V3

	Scenario: Sorting single digit problems with no +/-
	Given The Beast has a problem with colors White and difficulty V2
	When I go to the wall page for The Beast
	Then I should see problems in the order White, Blue

	Scenario: Sorting single digit problems with +
	Given The Beast has a problem with colors Green and difficulty V4+
	When I go to the wall page for The Beast
	Then I should see problems in the order Blue, Green

	Scenario: Sorting single digit problems with -
	Given The Beast has a problem with colors Black and difficulty V1-
	When I go to the wall page for The Beast
	Then I should see problems in the order Black, Blue
	
	Scenario: Sorting single digit problems with +/1
	Given The Beast has a problem with colors Black and difficulty V3+
	Given The Beast has a problem with colors White and difficulty V3-
	When I go to the wall page for The Beast
	Then I should see problems in the order White, Blue, Black

	Scenario: Sorting two digit problems
	Given The Beast has a problem with colors Neon Green and difficulty V10
	When I go to the wall page for The Beast
	Then I should see problems in the order Blue, Neon Green
