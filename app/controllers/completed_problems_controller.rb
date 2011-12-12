class CompletedProblemsController < ApplicationController
  # GET /completed_problems/new
  def new
    @completed_problem = CompletedProblem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @completed_problem }
    end
  end

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

  # PUT /completed_problems/1
  def update
    @completed_problem = CompletedProblem.find(params[:id])

    respond_to do |format|
      if @completed_problem.update_attributes(params[:completed_problem])
        format.html { redirect_to(@completed_problem, :notice => 'Completed problem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @completed_problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /completed_problems/1
  def destroy
    @completed_problem = CompletedProblem.find(params[:id])
    @completed_problem.destroy

    respond_to do |format|
      format.html { redirect_to(completed_problems_url) }
      format.xml  { head :ok }
    end
  end
end
