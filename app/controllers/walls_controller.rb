class WallsController < ApplicationController
  load_and_authorize_resource
  
  def show
    @wall = Wall.find(params[:id], :include => :problems)
  end

  def new
    @wall = Wall.new
    @gyms = Gym.all
  end

  def edit
    @wall = Wall.find(params[:id])
  end

  def create
    @wall = Wall.new(params[:wall])

    if @wall.save
      redirect_to(new_wall_path, :notice => 'Wall was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /walls/1
  # PUT /walls/1.xml
  def update
    @wall = Wall.find(params[:id])

    respond_to do |format|
      if @wall.update_attributes(params[:wall])
        format.html { redirect_to(@wall, :notice => 'Wall was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wall.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /walls/1
  # DELETE /walls/1.xml
  def destroy
    @wall = Wall.find(params[:id])
    @wall.destroy

    respond_to do |format|
      format.html { redirect_to(walls_url) }
      format.xml  { head :ok }
    end
  end
end
