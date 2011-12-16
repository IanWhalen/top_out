class HomeController < ApplicationController
  def index
    @latest_gym = current_user.try(:gym_of_last_completion)
    @latest_session = current_user.try(:latest_climbing_session)
  end
end
