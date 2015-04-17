Rails.application.routes.draw do
  root 'tours#index'
  resources :tours do
    resources :stops
  end

  resources :tour_stops, only: [:index]
  devise_for :users

end
