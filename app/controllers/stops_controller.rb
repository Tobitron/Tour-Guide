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
        redirect_to new_tour_stop_path(@tour)
      else
        flash[:notice] = "Ruh roh! Something went wrong."
        render :new
      end
    else
      flash[:notice] = @stop.errors.full_messages
      render :new
    end
  end

  def new_stop_number(tour)
  # should def be in model, will do later
    if tour.tour_stops.last.stop_number == nil
      new_stop = 1
    else
      new_stop = tour.tour_stops.last.stop_number + 1
    end
  end

  protected
  def stop_params
    params.require(:stop).permit(:name, :description, :latitude, :longitude, :stop_length)
  end
end
