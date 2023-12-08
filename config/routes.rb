Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "products#index"
  resources :shopping_carts, only: [:create,:destroy, :update], controller: 'shopping_carts'
end
