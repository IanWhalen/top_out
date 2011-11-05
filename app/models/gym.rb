class Gym < ActiveRecord::Base
  has_many :walls

  validates :name, :presence => true

  def live_wall_list
    # Super hack to force empty walls to end of sorted wall list
    walls.sort_by {|obj| obj.average_difficulty || 100 }
  end

end
