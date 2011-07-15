class Gym < ActiveRecord::Base
  has_many :walls

  validates :name, :presence => true
end
