class ClimbingSessionsController < ApplicationController
  # GET /climbing_sessions
  def index
    @climbing_sessions = ClimbingSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @climbing_sessions }
    end
  end

  # GET /climbing_sessions/1
  def show
    @climbing_session = ClimbingSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @climbing_session }
    end
  end

  # GET /climbing_sessions/new
  def new
    @climbing_session = ClimbingSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @climbing_session }
    end
  end

  # GET /climbing_sessions/1/edit
  def edit
    @climbing_session = ClimbingSession.find(params[:id])
  end

  # POST /climbing_sessions
  def create
    @climbing_session = ClimbingSession.new(params[:climbing_session])

    respond_to do |format|
      if @climbing_session.save
        format.html { redirect_to(@climbing_session, :notice => 'Climbing session was successfully created.') }
        format.xml  { render :xml => @climbing_session, :status => :created, :location => @climbing_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @climbing_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /climbing_sessions/1
  def update
    @climbing_session = ClimbingSession.find(params[:id])

    respond_to do |format|
      if @climbing_session.update_attributes(params[:climbing_session])
        format.html { redirect_to(@climbing_session, :notice => 'Climbing session was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @climbing_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /climbing_sessions/1
  def destroy
    @climbing_session = ClimbingSession.find(params[:id])
    @climbing_session.destroy

    respond_to do |format|
      format.html { redirect_to(climbing_sessions_url) }
      format.xml  { head :ok }
    end
  end
end
