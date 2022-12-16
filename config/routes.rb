Rails.application.routes.draw do

  default_url_options :host => "example.com"
  devise_for :users, controllers: { confirmations: 'users/confirmations' }
  resources :users, only: %i[show]
  resources :movies do
    resources :ratings
    resources :reviews
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'movies#index'
end
