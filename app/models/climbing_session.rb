class ClimbingSession < ActiveRecord::Base
  belongs_to :user
  has_many :completed_problems

  validates_presence_of :user

  def gym_name
    completed_problems.first.gym.name.to_s
  end

  def group_by_difficulty(grade)
    completed_problems.joins(:problem).where(:problems => { :difficulty => ["V#{grade}", "V#{grade}+", "V#{grade}-"]}).count
  end

  # Return an array of 16 numbers
  # Each number is the count problems solved for V0, V1, etc.
  def sparkline_data
    data = Array.new
    0.upto(16).each do |n|
      data << group_by_difficulty(n)
    end
    data
  end

  def sparkline_data_for_user_home
    sparkline_data.to_sentence(:words_connector => ",", :last_word_connector => ",")
  end

  def problem_count
    completed_problems.count
  end

  def problems
    Problem.
      joins(:completed_problems).
      where(:completed_problems => {:id => completed_problems}).
      sort
  end

  def hardest_problem_diff
    problems.last.difficulty
  end

  def fb_post_data
    data = Array.new
    16.downto(0).each do |n|
      val = group_by_difficulty(n)
      if group_by_difficulty(n) > 0
        data << "#{helpers.pluralize(val, "V#{n} problem", "V#{n} problems")}"
      end
    end

    "Today: #{data[0..2].to_sentence}.  Like a boss."
  end

  def helpers
      ActionController::Base.helpers
  end

end
