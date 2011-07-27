class CompletedProblemsController < ApplicationController
  # GET /completed_problems/new
  # GET /completed_problems/new.xml
  def new
    @completed_problem = CompletedProblem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @completed_problem }
    end
  end

  # POST /completed_problems
  # POST /completed_problems.xml
  def create
    @problem = Problem.find(params[:problem_id])
    @completed_problem = @problem.completed_problems.build
    @completed_problem.user = current_user

    if @completed_problem.save
      render :json => { }
    elsif @completed_problem.user == nil
      render :json => { :location => sign_in_path }
    else
      render :json => { :location => root_url, :notice => 'No idea what happened there.' }
    end
  end

  # PUT /completed_problems/1
  # PUT /completed_problems/1.xml
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
  # DELETE /completed_problems/1.xml
  def destroy
    @completed_problem = CompletedProblem.find(params[:id])
    @completed_problem.destroy

    respond_to do |format|
      format.html { redirect_to(completed_problems_url) }
      format.xml  { head :ok }
    end
  end
end
