Given /^I have gyms named (.+)$/ do |names|
  names.split(', ').each do |name|
    Gym.create!(:name => name)
  end
end
