module WallsHelper
  def show_last_completed_problem_for_user(user, problem)
    return "Not logged in" if current_user.nil?

    completed = user.last_completed_problem(problem)

    return "Not done yet" if completed.nil?
 
    return "#{time_ago_in_words(completed.created_at)} ago"
  end

end
