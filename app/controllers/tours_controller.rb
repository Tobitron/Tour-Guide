class ToursController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :fetch_tour, only: [:show, :edit, :destroy, :update]

  def index
    @tours = Tour.all
    # get_food_drinks_tours why won't method work? It's in a class.
    @food_drinks_tours = Tour.where(category: "Food/Drinks").limit(10)
    @site_seeing = Tour.where(category: "Site Seeing").limit(10)
    @history = Tour.where(category: "History").limit(10)
    @architecture = Tour.where(category: "Architecture").limit(10)
    @hybrid = Tour.where(category: "hybrid").limit(10)
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
    @tour_data = StopsData.get_data(@tour)
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @tour_data }
    end
  end

  def update
    respond_to do |format|
      format.json do

        tour_distance = 0
        params[:leg_lengths].values.each do |distance|
          tour_distance += distance[:text].to_f
        end
        # Move this to the model later
        transit_time = 0
        params[:tour_legs].values.each do |length|
          transit_time += length[:value].to_i
        end

        time_spent_at_stop = 0
        stops = @tour.stops
        stops.each do |stop|
        time_spent_at_stop += stop.stop_length
      end

      total_tour_time = (time_spent_at_stop * 60) + transit_time
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
