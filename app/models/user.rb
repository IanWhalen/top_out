class User < ActiveRecord::Base
  # Also :token_authenticatable, :confirmable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :completed_problems
  has_many :problems, :through => :completed_problems
  has_many :climbing_sessions

  after_create :send_welcome_email

  def total_problems_solved
    Problem.includes({:completed_problems => :user}).where('users.id = ?', self.id).count
  end

  # Find user's most recent CompletedProblem
  def last_completion
    completed_problems.try(:first)
  end

  # Find user's most recent CompletedProblem for a given Problem
  def last_completed_problem(problem)
    completed_problems.where(:completed_problems => {:problem_id => problem}).first
  end

  def time_of_last_completion
    last_completion.try(:updated_at)
  end

  def gym_of_last_completion
    last_completion.try(:gym)
  end

  def most_recent_climbing_session
    last_completion.try(:climbing_session)
  end

  # Finds all live problems at a given gym which the user has not yet completed
  def unsolved_problems(gym)
    Problem.includes({:wall => :gym}, :completed_problems).
      where('problems.is_live = ? AND gyms.id = ? AND problems.id NOT IN (select problem_id from completed_problems where user_id = ?)', true, gym.id, self.id)
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

end
