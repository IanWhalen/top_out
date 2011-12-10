class CompletedProblem < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem
  belongs_to :climbing_session
  has_one :gym, :through => :problem

  default_scope :order => 'updated_at DESC'

  validates_presence_of :user
  validates_presence_of :problem
  validates_presence_of :climbing_session

  def create_or_update_climbing_session(user)
    @now = Time.now.utc
    # Append to existing ClimbingSession if user completed anything in past 3 hours
    if user.time_of_last_completion && user.latest_climbing_session && @now - user.time_of_last_completion < 10800
      self.climbing_session = user.latest_climbing_session
      self.climbing_session.finish = @now
    # If not then create a new ClimbingSession
    else
      self.climbing_session = ClimbingSession.create!(:user => user)
      self.climbing_session.start = @now
      self.climbing_session.finish = @now + 5.minutes
    end
    self.climbing_session.save
  end
end
