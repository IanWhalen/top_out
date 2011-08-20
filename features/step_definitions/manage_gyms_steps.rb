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

