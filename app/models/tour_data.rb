class TourData

  def get_food_drinks_tours
    food_drinks_tours = Tour.where(category: "Food/Drinks")
  end
end
