# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Gym.delete_all
@gym = Gym.create(:name => 'Brooklyn Boulders')

Wall.delete_all
Problem.delete_all
['The Beast', 'Nor\'Easter (Yellow)'].each do |wall|
  @wall = @gym.walls.create(:name => wall)
  @problem = @wall.problems.create(:color_one => :Blue, :color_two => :White, :color_three => :Green, :difficulty_display => "V2+", :difficulty_position => 8)
  @problem = @wall.problems.create(:color_one => :Black, :color_two => :'Neon Green', :difficulty_display => "V2-", :difficulty_position => 6)
  @problem = @wall.problems.create(:color_one => :Blue, :difficulty_display => "V2", :difficulty_position => 7)
end
