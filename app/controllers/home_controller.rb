class HomeController < ApplicationController
  def index
    @latest_gym = current_user.try(:gym_of_last_completion)
  end
end
