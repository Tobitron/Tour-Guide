class TourStopsController < ApplicationController
  def index
    @tour_stops = TourStop.all
    render json: @tour_stops
  end
end
