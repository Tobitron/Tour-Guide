class ToursController < ApplicationController

  def index
    @tours = Tour.all
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      flash[:notice] = 'Tour created.'
      redirect_to new_tour_stop_path(@tour)
    else
      flash[:notice] = @tour.errors.full_messages
      render :new
    end
  end

  def show
    @tour = Tour.find(params[:id])
    @stops = @tour.stops

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @stops.to_json }
    end
  end

  protected
    def tour_params
      params.require(:tour).permit(:name)
    end
end
