class Wall < ActiveRecord::Base
  belongs_to :gym
  has_many   :problems
  has_many   :routes
  
  validates :name, :presence => true

  def live_problems_sorted_by_diff
    self.problems.all.sort {|a,b| Difficulty.to_int(a.difficulty) <=> Difficulty.to_int(b.difficulty)}
  end

  def gym_plus_wall_name
    "#{self.gym.name} - #{self.name}"
  end
end
