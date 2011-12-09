class ProblemsController < ApplicationController
  load_and_authorize_resource

  def new
    @problem = Problem.new(:is_live => true)
    @wall = Wall.find(params[:wall_id])
    @colors = Color::CHOICES
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def create
    @problem = Problem.new(params[:problem])
    @problem.wall_id = params[:wall_id]

    if @problem.save
      redirect_to(new_wall_problem_path(params[:wall_id]), :notice => "#{@problem.name} #{@problem.difficulty} problem was successfully created.")
    else
      render :action => "new"
    end
  end

  # PUT /problems/1
  def update
    @problem = Problem.find(params[:id])

    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        format.html { redirect_to(@problem, :notice => 'Problem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to(problems_url) }
      format.xml  { head :ok }
    end
  end
end
