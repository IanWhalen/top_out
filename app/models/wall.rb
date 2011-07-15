class Wall < ActiveRecord::Base
  belongs_to :gym
  has_many   :problems
  has_many   :routes
  
  validates :name, :presence => true
end
