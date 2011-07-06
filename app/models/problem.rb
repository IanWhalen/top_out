class Problem < ActiveRecord::Base
  belongs_to :wall
  has_many :users, :through => :completed_problems
end
