class StopsController < ApplicationController

  def new
    @stop = Stop.new
    @tour = Tour.find(params[:tour_id])
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @stop = Stop.new(stop_params)

    if @stop.save
      tour_stop = TourStop.new(tour_id: @tour.id, stop_id: @stop.id, stop_number: @tour.new_stop_number)
      if tour_stop.save
        flash[:notice] = "New stop created"
        redirect_to new_tour_stop_path(@tour)
      else
        flash[:notice] = "Something went wrong."
        render :new
      end
    else
      flash[:notice] = @stop.errors.full_messages
      render :new
    end
  end

  def edit
    @stop = Stop.find(params[:id])
    @tour = Tour.find(params[:tour_id])
    @tour_data = StopsData.get_data(@tour)
    respond_to do |format|
      format.html { render :edit }
      format.json { render json: @tour_data }
    end
  end

  def update
    @stop = Stop.find(params[:id])
    @tour = Tour.find(params[:tour_id])
    if @stop.update(stop_params)
      flash[:notice] = 'Stop Updated'
      redirect_to tour_path(@tour)
    else
      flash[:alert] = 'Error: stop not updated'
      render :edit
    end
  end

  def destroy
    @tour = Tour.find(params[:tour_id])
    @stop = Stop.find(params[:id])
    if @stop.destroy
      flash[:notice] = 'Stop Deleted'
      redirect_to tour_path(@tour)
    end
  end

  protected
  def stop_params
    params.require(:stop).permit(:name, :description, :latitude, :longitude, :stop_length)
  end
end
