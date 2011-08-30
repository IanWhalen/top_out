Given /^I have gyms named (.+)$/ do |gym_names|
  gym_names.split(', ').each do |gym_name|
    @gym = Gym.create!(:name => gym_name)
  end
end

Given /^(.+) has walls named (.+)$/ do |gym_name, wall_names|
  wall_names.split(', ').each do |wall_name|
    @gym.walls.create!(:name => wall_name)
  end
end

Given /^(.+) has a problem with colors (.+)$/ do |wall_name, colors|
  @wall = Wall.find_by_name(wall_name)
  @color_list = colors.split(', ')
  color_one = @color_list[0]
  color_two = @color_list[1]
  color_three = @color_list[2]
  @wall.problems.create!(:color_one => color_one, :color_two => color_two, :color_three => color_three, :difficulty => "V2+")
end

Given /^I am not signed in$/ do
  visit('/users/sign_out')
end

When /^I click the problem "(.*)"$/ do |problem_name|
  find(:xpath, "//h3[text() = '#{problem_name}']/parent::a").click
end

When /^I click the modal button "Yeah!"$/ do
  find(:xpath, "//span[text() = 'Yeah!']/parent::span/parent::a").click
end

# VZ tech support 877-600-2051

Given /^no user exists with an email of "(.*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  Given %{I am not signed in}
  When %{I go to the sign in page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Sign in"}
end

Then /^I should be signed out$/ do
  And %{I should see "Sign Up"}
  And %{I should see "Sign In"}
  And %{I should not see "Sign Out"}
end

Given /^I am a user with email "(.*)" and password "(.*)"$/ do |email, password|
  User.create!(:email => email, :password => password)
end

Then /^I should be signed in$/ do
  %{I should see "Signed in succesfully."}
end

When /^I return next time$/ do
  And %{I go to the home page}
end

When /^I sign out$/ do
  visit('/users/sign_out')
end

Then /^I should be already signed in$/ do
  And %{I should see "Sign Out"}
end

