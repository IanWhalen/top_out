class User < ActiveRecord::Base
  # Also :token_authenticatable, :confirmable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :completed_problems
  has_many :problems, :through => :completed_problems

  after_create :send_welcome_email

  # Finds the presence of last completed problem
  def last_completed_problem(problem)
    completed_problems.order('created_at DESC').where(:completed_problems => {:problem_id => problem}).limit(1).first
  end

  def unsolved_problems(gym)
    Problem.includes({:wall => :gym}, {:completed_problems => :user}).where('problems.is_live IS ? AND gyms.id IS ? AND users.id is not ?', true, gym.id, self.id).sort {|a,b| Difficulty.to_int(a.difficulty) <=> Difficulty.to_int(b.difficulty)}
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

end
