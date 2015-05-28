class ToursController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :fetch_tour, only: [:show, :edit, :destroy, :update]

  def index
    @food_drinks_tours = Tour.get_tour_by_category("Food/Drinks", 8)
    @site_seeing = Tour.get_tour_by_category("Site Seeing", 8)
    @history = Tour.get_tour_by_category("History", 8)
    @architecture = Tour.get_tour_by_category("Architecture", 8)
    @hybrid = Tour.get_tour_by_category("Hybrid", 8)
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(name: tour_params[:name], category: tour_params[:category], user_id: current_user.id)
    if @tour.save
      flash[:notice] = 'Tour created.'
      redirect_to new_tour_stop_path(@tour)
    else
      flash[:notice] = @tour.errors.full_messages
      render :new
    end
  end

  def show
    @tour_length_parsed = distance_of_time_in_words(@tour.tour_length)
    @stops = @tour.stops
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @tour }
    end
  end

  def update
    respond_to do |format|
      format.json do
        tour_distance = @tour.tour_distance(params[:tour_legs])
        total_tour_time = @tour.calculate_tour_time(params[:tour_legs])

        if @tour.update(tour_length: total_tour_time, tour_distance: tour_distance)
          flash[:notice] = 'Tour length updated'
        else
          flash[:alert] = 'Error: tour not updated'
          render :edit
        end
      end
      format.html do
        if @tour.update(tour_params)
          flash[:notice] = 'Tour Updated'
          redirect_to tour_path(@tour)
        else
          flash[:alert] = 'Error: tour not updated'
          render :edit
        end
      end
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
      params.require(:tour).permit(:name, :category)
    end

    def fetch_tour
      @tour = Tour.find(params[:id])
    end
end
