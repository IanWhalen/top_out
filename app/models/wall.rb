class Wall < ActiveRecord::Base
  belongs_to :gym
  has_many   :problems
  has_many   :routes
  
  validates :name, :presence => true
  
  scope :sort_by_average_diff, order(:average_difficulty)

  def average_difficulty
    @p = problems.where(:is_live => true)
    @p.inject(0.0){|sum, i| sum + Difficulty.to_int(i.difficulty) } / @p.size
  end

  def live_problems_sorted_by_diff
    self.problems.all.sort {|a,b| Difficulty.to_int(a.difficulty) <=> Difficulty.to_int(b.difficulty)}
  end

  def gym_plus_wall_name
    "#{self.gym.name} - #{self.name}"
  end

  def sparkline_data
    @p = self.problems.where(:is_live => true)
    data = @p.where(:difficulty => ['V0', 'V0+', 'V0-']).count.to_s
    (1..16).each do |n|
      data << "," << @p.where(:difficulty => ["V#{n}", "V#{n}+", "V#{n}-"]).count.to_s
    end
    return data
  end
end
