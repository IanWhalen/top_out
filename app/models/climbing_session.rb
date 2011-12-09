class ClimbingSession < ActiveRecord::Base
  belongs_to :user
  has_many :completed_problems

  validates_presence_of :user
end
