Rails.application.routes.draw do
  root 'tours#index'
  resources :tours
  resources :stop

  devise_for :users

end
