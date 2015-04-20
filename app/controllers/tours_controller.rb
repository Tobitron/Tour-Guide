class ToursController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :fetch_tour, only: [:show, :edit, :destroy, :update]

  def index
    @tours = Tour.all
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(name: tour_params[:name], user_id: current_user.id)
    if @tour.save
      flash[:notice] = 'Tour created.'
      redirect_to new_tour_stop_path(@tour)
    else
      flash[:notice] = @tour.errors.full_messages
      render :new
    end
  end

  def show
    @stops = @tour.stops
    @tour_data = StopsData.get_data(@tour)
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @tour_data }
    end
  end

  def update
    if @tour.update(tour_params)
      flash[:notice] = 'Tour Updated'
      redirect_to tour_path(@tour)
    else
      flash[:alert] = 'Error: tour not updated'
      render :edit
    end
  end

  def destroy
    if @tour.destroy
      flash[:notice] = 'Tour Deleted'
      redirect_to root_path
    end
  end

  protected
    def tour_params
      params.require(:tour).permit(:name)
    end

  def fetch_tour
    @tour = Tour.find(params[:id])
  end
end
