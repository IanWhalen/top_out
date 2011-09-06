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

Then /^I should be signed in$/ do
  %{I should see "Signed in succesfully."}
end

When /^I sign out$/ do
  visit('/users/sign_out')
end

Then /^I should be already signed in$/ do
  And %{I should see "Sign Out"}
end
