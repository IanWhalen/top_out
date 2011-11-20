class Wall < ActiveRecord::Base
  belongs_to :gym
  has_many   :problems
  has_many   :live_problems, :class_name => 'Problem', :conditions => ['is_live = ?', true]
  has_many   :routes
  
  validates :name, :presence => true
  
  def average_difficulty
    @p = live_problems
    if @p.size > 0
      @avg = @p.inject(0.0){|sum, i| sum + Difficulty.to_int(i.difficulty) } / @p.size
    else
      @avg = nil
    end
  end

  def gym_plus_wall_name
    "#{gym.name} - #{name}"
  end

  def sparkline_data
    @p = live_problems
    data = @p.where(:difficulty => ['V0', 'V0+', 'V0-']).count.to_s
    (1..16).each do |n|
      data << "," << @p.where(:difficulty => ["V#{n}", "V#{n}+", "V#{n}-"]).count.to_s
    end
    return data
  end
end
