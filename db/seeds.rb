# Start with a clean slate
CompletedProblem.delete_all
ClimbingSession.delete_all
Gym.delete_all
Wall.delete_all
Problem.delete_all
User.delete_all

# Create test gym
@gym = Gym.create(:name => 'Brooklyn Boulders')

# Add 2 walls with 3 identical problems each to test gym
['The Beast', 'Nor\'Easter (Yellow)'].each do |wall|
  @wall = @gym.walls.create(:name => wall)
  @problem = @wall.problems.create(:color_one => 'Blue', :color_two => 'White', :color_three => 'Green', :difficulty=> "V2+")
  @problem = @wall.problems.create(:color_one => 'Black', :color_two => 'Neon Green', :difficulty => "V2-")
  @problem = @wall.problems.create(:color_one => 'Blue', :difficulty => "V2")
end

# Create test admin and normal user
@user = User.create(:email => 'user@thetopout.com', :password => 'usertest')
@admin = User.create(:email => 'admin@thetopout.com', :password => 'admintest')
@admin.update_attribute :admin, true
