class GymsController < ApplicationController
  before_filter :find_gym, :only => [:show, :edit, :unsolved, :update, :destroy]

  def index
    @gyms = Gym.all
  end

  def new
    @gym = Gym.new
  end

  protected
    def find_gym
      @gym = Gym.find(params[:id])
    end
end
