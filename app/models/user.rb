class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  has_many :completed_problems
  has_many :problems, :through => :completed_problems

  validates_presence_of :password, :on => :create
  validates_presence_of :password
  validates_uniqueness_of :email
end
