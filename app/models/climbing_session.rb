class ClimbingSession < ActiveRecord::Base
  belongs_to :user
  has_many :completed_problems

  validates_presence_of :user

  #
  #
  # Return a string
  def readable_start_date
    start.strftime("%B %e, %Y")
  end

  # The name of the gym for the first problem in a ClimbingSession
  #
  # Returns a string
  def gym_name
    completed_problems.first.gym.name.to_s
  end

  # The number of problems solved for a given grouping of difficulties
  #
  # Returns an integer
  def count_by_difficulty_group(diff)
    completed_problems.joins(:problem).where(:problems => { :difficulty => ["V#{diff}", "V#{diff}+", "V#{diff}-"]}).count
  end

  # The number of problems solved for all grouping of difficulties
  #
  # Returns an array of 16 integers
  def raw_sparkline_data
    data = []
    0.upto(16).each {|diff| data << count_by_difficulty_group(diff)}
    data
  end

  # The string used by Sparkline JS to render graph on user home
  #
  # Returns a string of 16 comma-separated integers
  def sparkline_data_for_user_home
    raw_sparkline_data.to_sentence(:words_connector => ",", :last_word_connector => ",")
  end

  # The number of distinct problems in a ClimbingSession
  #
  # Returns an integer
  def problem_count
    completed_problems.count
  end

  #
  #
  #
  def problems
    Problem.joins(:completed_problems).where(:completed_problems => {:id => completed_problems}).sort
  end

  # The difficulty of the hardest problem in the ClimbingSession
  #
  # Returns a string
  def hardest_problem_diff
    problems.last.difficulty
  end

  #
  #
  # Returns a string
  def fb_post_data
    data = []
    16.downto(0).each {|diff| data << pluralize_problem(count_by_difficulty_group(diff), diff) if count_by_difficulty_group(diff) > 0}
    "Today: #{data[0..2].to_sentence}.  Like a boss."
  end

  #
  #
  # Returns a string
  def pluralize_problem(count, diff_group)
    helpers.pluralize(count, "V#{diff_group} problem", "V#{diff_group} problems")
  end

  # 
  #
  # Returns nothing
  def helpers
    ActionController::Base.helpers
  end
end
