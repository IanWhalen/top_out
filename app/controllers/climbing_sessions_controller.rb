class ClimbingSessionsController < ApplicationController
  # GET /climbing_sessions/1
  def show
    @climbing_session = ClimbingSession.find(params[:id])
  end
end
