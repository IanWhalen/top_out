Given /^I am not signed in$/ do
  visit('/users/sign_out')
end

Given /^no user exists with email "(.*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

Given /^user "(.*)" has admin privileges$/ do |email|
  User.find(:first, :conditions => { :email => email }).update_attribute :admin, true
end

Given /^a user exists with email "(.*)" and password "(.*)"$/ do |email, password|
  User.create!(:email => email, :password => password)
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  step %{I am not signed in}
  step %{I go to the sign in page}
  step %{I fill in "email" with "#{email}"}
  step %{I fill in "password" with "#{password}"}
  step %{I press "Sign in"}
end

Then /^I should be signed out$/ do
  step %{I should see "Sign in"}
  step %{I should not see "Sign out"}
end

Then /^I should be signed in$/ do
  step %{I should see "Signed in successfully."}
end

When /^I sign out$/ do
  visit('/users/sign_out')
end

Then /^I should be already signed in$/ do
  step %{I should see "Sign out"}
end
