class ClimbingSession < ActiveRecord::Base
  belongs_to :user
  has_many :completed_problems

  validates_presence_of :user

  def gym_name
    completed_problems.first.gym.name.to_s
  end

  def sparkline_data
    @p = completed_problems
    data = @p.joins(:problem).where(:problems => { :difficulty => ["V0", "V0+", "V0-"]}).count.to_s
    (1..16).each do |n|
      data << "," << @p.joins(:problem).where(:problems => { :difficulty => ["V#{n}", "V#{n}+", "V#{n}-"]}).count.to_s
    end
    return data
  end

  def problem_count
    @count = completed_problems.count
  end

  def hardest_problem_diff
    Problem.joins(:completed_problems).
      where(:completed_problems => {:id => completed_problems}).
      sort.
      last.
      difficulty
  end

end
