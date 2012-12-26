class CompletedProblemsController < ApplicationController

  # POST /completed_problems
  def create
    if current_user.nil?
      render :json => { :sign_in_needed => new_user_session_path }
    else
      @problem = Problem.find(params[:problem_id])
      @completed_problem = @problem.completed_problems.build
      @completed_problem.user = current_user
      @completed_problem.create_or_update_climbing_session(current_user)

      if @completed_problem.save && request.xhr?
        render :json => { :problem_id => @completed_problem.problem_id }
      else
        render :json => { :location => root_url, :notice => 'No idea what happened there.' }
      end

    end
  end
end