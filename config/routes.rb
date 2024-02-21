Rails.application.routes.draw do

  root "products#index"

  resources :products

  # When the url add /products, the page will direct to the index action (Controller) and index page (View).
  get '/products', to: 'products#index'

  get 'products/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
