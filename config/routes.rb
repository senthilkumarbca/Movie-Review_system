Rails.application.routes.draw do

  devise_for :users, controllers: { confirmations: 'users/confirmations' }
  resources :movies do
    resources :ratings
    resources :reviews
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'movies#index'
end
