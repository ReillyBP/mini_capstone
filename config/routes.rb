Rails.application.routes.draw do
  get "/carted_products", to: "carted_products#index"
  post "/carted_products", to: "carted_products#create"
  delete "/carted_products/:id", to: "carted_products#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#index"
  get "/products", to:"products#index"
  get "/products/new", to: "products#new"
  post "/products", to: "products#create"
  get "/products/:id", to: "products#show"
  get "/products/:id/edit", to: "products#edit"
  patch "products/:id", to: "products#update"
  delete "/products/:id", to: "products#destroy" 

  get "/products/:product_id/images/new", to: "images#new"
  post "products/:product_id/images", to: "images#create"

  # User Login
  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # Orders
  post "/orders", to: "orders#create"
  get "/orders/:id", to: "orders#show"
end
