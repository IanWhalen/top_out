class Wall < ActiveRecord::Base
  belongs_to :gym
  has_many   :problems
  has_many   :live_problems, :class_name => 'Problem', :conditions => ['is_live = ?', true]
  has_many   :routes
  
  validates :name, :presence => true
 
  # Average difficulty of all live Problems on the wall
  #
  # Returns an integer or nil
  def average_difficulty
    @p = live_problems
    if @p.size > 0
      @avg = @p.inject(0.0){|sum, i| sum + Difficulty.to_int(i.difficulty) } / @p.size
    else
      @avg = nil
    end
  end

  # Name of the Gym and the Wall
  #
  # Returns a string
  def gym_plus_wall_name
    "#{gym.name} - #{name}"
  end

  # The number of live problems on this wall for a given grouping of difficulties
  #
  # Returns a string of 16 comma-separated integers
  def sparkline_data
    @p = live_problems
    data = @p.where(:difficulty => ['V0', 'V0+', 'V0-']).count.to_s
    (1..16).each do |n|
      data << "," << @p.where(:difficulty => ["V#{n}", "V#{n}+", "V#{n}-"]).count.to_s
    end
    return data
  end
end
