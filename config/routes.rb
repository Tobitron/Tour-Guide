Rails.application.routes.draw do
  root 'tours#index'
  resources :tours, only: [:index, :show, :new, :create] do
    resources :stops, only: [:new, :create]
  end
  
  devise_for :users

end
