class Wall < ActiveRecord::Base
  belongs_to :gym
  has_many   :problems
  has_many   :routes
  
  validates :name, :presence => true

  def gym_plus_wall_name
    "#{self.gym.name} - #{self.name}"
  end
end
