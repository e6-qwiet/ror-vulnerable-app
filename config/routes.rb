Rails.application.routes.draw do
  get "reviews", to: "reviews#index"
  get "reviews/new"
  get "reviews/create"
  post "reviews/create"
  get "reviews/destroy"
  #devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "products#index"
  get "/about", to: "products#about"
  get "/product_search", to: "products#search", as: "search_products"

  get "/cart", to: "carts#view"
  post "/cart/add", to: "carts#add"
  post "/cart/remove", to: "carts#remove"

  get "/new_order", to: "orders#new"
  post "/new_order/check", to: "orders#check"
  get "/new_order/check", to: "orders#get_check"
  post "/new_order/create", to: "orders#create"
  get "/orders/:id", to: "orders#view", as: "order"
end
