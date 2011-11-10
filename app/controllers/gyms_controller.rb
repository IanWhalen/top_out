class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def new
    @gym = Gym.new
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  # PUT /gyms/1
  def update
    @gym = Gym.find(params[:id])

    respond_to do |format|
      if @gym.update_attributes(params[:gym])
        format.html { redirect_to(@gym, :notice => 'Gym was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gym.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gyms/1
  def destroy
    @gym = Gym.find(params[:id])
    @gym.destroy

    respond_to do |format|
      format.html { redirect_to(gyms_url) }
      format.xml  { head :ok }
    end
  end
end
