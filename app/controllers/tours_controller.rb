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
        # Move this to the model later
        binding.pry
        walking_time_minutes = params[:tour_length][:rows]["0"][:elements]["0"][:duration][:value].to_i / 60

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
