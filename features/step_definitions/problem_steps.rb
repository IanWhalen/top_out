Given /^(.+) has a problem with colors (.+)$/ do |wall_name, colors|
  @wall = Wall.find_by_name(wall_name)
  @color_list = colors.split(', ')
  color_one = @color_list[0]
  color_two = @color_list[1]
  color_three = @color_list[2]
  @wall.problems.create!(:color_one => color_one, :color_two => color_two, :color_three => color_three, :difficulty => "V2+")
end

Then /^there is a "(.*)" problem with colors "([^"]*)" on wall "([^"]*)"$/ do |diff, colors, wall_name|
  @wall = Wall.find_by_name(wall_name)
  @color_list = colors.split(', ')
  c_one = @color_list[0]
  c_two = @color_list[1]
  c_three = @color_list[2]
  @p = @wall.problems.first(:conditions => { :color_one => c_one, :color_two => c_two, :color_three => c_three, :difficulty => diff })
end

Then /^there is a problem named "(.*)"$/ do |problem_name|
  problem_name == @p.name
end

When /^I click the problem "(.*)"$/ do |problem_name|
  find(:xpath, "//h3[text() = '#{problem_name}']/parent::div/parent::a").click
end

When /^I confirm the popup$/ do
  page.driver.browser.switch_to.alert.accept    
end

When /^I dismiss the popup$/ do
  page.driver.browser.switch_to.alert.dismiss
end
