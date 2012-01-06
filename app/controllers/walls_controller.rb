class WallsController < ApplicationController
  load_and_authorize_resource
  before_filter :find_wall, :only => [:show, :edit, :clear]

  def new
    @wall = Wall.new
    @gyms = Gym.all
  end

  def create
    @wall = Wall.new(params[:wall])

    if @wall.save
      redirect_to(new_wall_path, :notice => 'Wall was successfully created.')
    else
      render :action => "new"
    end
  end

  def clear
    @wall.live_problems.update_all(:is_live => false)
    redirect_to(gym_url(@wall.gym))
  end

  protected
    def find_wall
      @wall = Wall.find(params[:id])
    end
end
