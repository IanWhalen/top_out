class CompletedProblemsController < ApplicationController
  # GET /completed_problems
  # GET /completed_problems.xml
  def index
    @completed_problems = CompletedProblem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @completed_problems }
    end
  end

  # GET /completed_problems/1
  # GET /completed_problems/1.xml
  def show
    @completed_problem = CompletedProblem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @completed_problem }
    end
  end

  # GET /completed_problems/new
  # GET /completed_problems/new.xml
  def new
    @completed_problem = CompletedProblem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @completed_problem }
    end
  end

  # GET /completed_problems/1/edit
  def edit
    @completed_problem = CompletedProblem.find(params[:id])
  end

  # POST /completed_problems
  # POST /completed_problems.xml
  def create
    @completed_problem = CompletedProblem.new(params[:completed_problem])

    respond_to do |format|
      if @completed_problem.save
        format.html { redirect_to(@completed_problem, :notice => 'Completed problem was successfully created.') }
        format.xml  { render :xml => @completed_problem, :status => :created, :location => @completed_problem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @completed_problem.errors, :status => :unprocessable_entity }
      end
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
