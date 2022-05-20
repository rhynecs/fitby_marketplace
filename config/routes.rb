Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/edit-profile/:id", to: "users#edit", as: "update_profile"
  delete "/users/:id", to: "users#destroy", as: "delete_user"
  patch "/users/:id", to: "users#update"
  get "/listings/new", to: "listings#new", as: "new_listing"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
