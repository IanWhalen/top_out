class Gym < ActiveRecord::Base
  has_many :walls

  validates :name, :presence => true

  def live_wall_list
    # Super hack to force empty walls to end of sorted wall list
    walls.sort_by {|obj| obj.average_difficulty || 100 }
  end

  def all_live_problems
    Problem.includes({:wall => :gym}).
            where('problems.is_live = ? AND gyms.id = ?', true, self.id).
            sort {|a,b| Difficulty.to_int(a.difficulty) <=> Difficulty.to_int(b.difficulty)}
  end
end
