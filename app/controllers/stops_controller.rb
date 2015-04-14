class StopsController < ApplicationController

  def index
  end

  def new
    @stop = Stop.new
    @tour = Tour.find(params[:tour_id])
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @stop = Stop.new(stop_params)

    if @stop.save
      tour_stop = TourStop.new(tour_id: @tour.id, stop_id: @stop.id, stop_number: new_stop_number(@tour))
      
      if tour_stop.save
        flash[:notice] = "New stop created"
        render :new
      else
        flash[:notice] = "Ruh roh! Something went wrong."
      end
    else
      flash[:notice] = @stop.errors.full_messages
      render :new
    end
  end

  def new_stop_number(tour)
  # should def be in model, will do later
    last_stop = tour.tour_stops.last
    new_stop = last_stop.stop_number + 1
  end

  protected
  def stop_params
    params.require(:stop).permit(:name, :description, :latitude, :longitude, :stop_length)
  end
end
