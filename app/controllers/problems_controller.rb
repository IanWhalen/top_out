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
end
