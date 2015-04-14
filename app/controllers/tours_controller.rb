class ToursController < ApplicationController

  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @stops = @tour.stops
  end


  protected
    def tour_params
      params.require(:tour).permit(:name)
    end
end
