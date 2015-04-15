class StopsController < ApplicationController

  def new
    @stop = Stop.new
    @tour = Tour.find(params[:tour_id])
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @stop = Stop.new(stop_params)

    if @stop.save
      tour_stop = TourStop.new(tour_id: @tour.id, stop_id: @stop.id, stop_number: @stop.new_stop_number)
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

  protected
  def stop_params
    params.require(:stop).permit(:name, :description, :latitude, :longitude, :stop_length)
  end
end
