Rails.application.routes.draw do
  root 'tours#index'
  resources :tours do
    resources :stops
  end

  devise_for :users

end
