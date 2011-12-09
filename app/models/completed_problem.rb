class CompletedProblem < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem
  belongs_to :climbing_session

  validates_presence_of :user
  validates_presence_of :problem
  validates_presence_of :climbing_session
end
