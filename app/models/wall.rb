class Wall < ActiveRecord::Base
  belongs_to :gym
  has_many   :problems
  has_many   :routes
  
  validates :name, :presence => true

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
