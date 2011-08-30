Feature: Manage Gyms
    In order to ...
    As an ...
    I want ...

		Background:
			Given I have gyms named Brooklyn Boulders
			And Brooklyn Boulders has walls named The Beast, Noreaster Yellow

    Scenario: Gym List
			When I go to the list of gyms
			Then I should see "Brooklyn Boulders"

    Scenario: Wall List
			When I go to the gym page for Brooklyn Boulders
			Then I should see "The Beast"
			And I should see "Noreaster Yellow"
