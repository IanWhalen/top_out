class CompletedProblem < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  validates_presence_of :user
  validates_presence_of :problem
end
