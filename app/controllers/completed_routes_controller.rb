class CompletedRoutesController < ApplicationController
  # GET /completed_routes
  # GET /completed_routes.xml
  def index
    @completed_routes = CompletedRoute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @completed_routes }
    end
  end

  # GET /completed_routes/1
  # GET /completed_routes/1.xml
  def show
    @completed_route = CompletedRoute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @completed_route }
    end
  end

  # GET /completed_routes/new
  # GET /completed_routes/new.xml
  def new
    @completed_route = CompletedRoute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @completed_route }
    end
  end

  # GET /completed_routes/1/edit
  def edit
    @completed_route = CompletedRoute.find(params[:id])
  end

  # POST /completed_routes
  # POST /completed_routes.xml
  def create
    @completed_route = CompletedRoute.new(params[:completed_route])

    respond_to do |format|
      if @completed_route.save
        format.html { redirect_to(@completed_route, :notice => 'Completed route was successfully created.') }
        format.xml  { render :xml => @completed_route, :status => :created, :location => @completed_route }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @completed_route.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /completed_routes/1
  # PUT /completed_routes/1.xml
  def update
    @completed_route = CompletedRoute.find(params[:id])

    respond_to do |format|
      if @completed_route.update_attributes(params[:completed_route])
        format.html { redirect_to(@completed_route, :notice => 'Completed route was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @completed_route.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /completed_routes/1
  # DELETE /completed_routes/1.xml
  def destroy
    @completed_route = CompletedRoute.find(params[:id])
    @completed_route.destroy

    respond_to do |format|
      format.html { redirect_to(completed_routes_url) }
      format.xml  { head :ok }
    end
  end
end
