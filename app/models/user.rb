class User < ActiveRecord::Base
  # Also :token_authenticatable, :confirmable, :encryptable, :lockable, and :timeoutable
  devise :database_authenticatable, :omniauthable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :completed_problems
  has_many :problems, :through => :completed_problems
  has_many :climbing_sessions

  after_create :send_welcome_email

  #
  #
  #
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.find_by_email(data.email)
      user
    else # Create a user with a stub password
      User.create!(:email => data.email, :password => Devise.friendly_token[0,20])
    end
  end
  
  # The most recent ClimbingSession for this User
  #
  # Returns a ClimbingSession object
  def latest_climbing_session
    climbing_sessions.try(:last)
  end

  # Count of all problems solved by this User
  #
  # Returns an integer
  def total_problems_solved
    Problem.includes({:completed_problems => :user}).where('users.id = ?', self.id).count
  end

  # Most recent CompletedProblem for this User
  def last_completion
    completed_problems.try(:first)
  end

  # Time this User last completed any Problem
  #
  # Returns a DateTime object
  def time_of_last_completion
    last_completion.try(:updated_at)
  end

  # The last Gym at which this User had a CompletedProblem
  #
  # Returns a Gym object
  def gym_of_last_completion
    last_completion.try(:gym)
  end

  # Most recent ClimbingSession for this User
  #
  # Returns a ClimbingSession object
  def latest_climbing_session
    last_completion.try(:climbing_session)
  end
  
  # Most recent CompletedProblem for a specifc Problem and this User
  def last_completion_of_problem(problem)
    completed_problems.where(:completed_problems => {:problem_id => problem}).first
  end

  # Time this User last completed a specific Problem
  #
  # Returns a DateTime object
  def time_of_last_completion_of_problem(problem)
    last_completion_of_problem(problem).try(:updated_at)
  end

  # Live Problems not yet completed by this User at a specific Gym
  #
  # Returns an Array of Problems
  def unsolved_problems(gym)
    Problem.includes({:wall => :gym}, :completed_problems).
      where('problems.is_live = ? AND gyms.id = ? AND problems.id NOT IN (select problem_id from completed_problems where user_id = ?)', true, gym.id, self.id)
  end

  private

  #
  #
  #
  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

end
