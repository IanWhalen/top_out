class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  has_many :completed_problems
  has_many :problems, :through => :completed_problems

  validates_presence_of :password, :on => :create
  validates_presence_of :password
  validates_uniqueness_of :email

  # Finds the presence of last completed problem
  def last_completed_problem(problem)
    completed_problems.order('created_at DESC').where(:completed_problems => {:problem_id => problem}).limit(1).first
  end

end
