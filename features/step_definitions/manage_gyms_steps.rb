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

Given /^I am not signed in$/ do
  visit('/users/sign_out') # ensure that at least
end

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

Then /^I should be already signed in$/ do
  And %{I should see "Sign Out"}
end

