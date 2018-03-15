Rails.application.routes.draw do
  resources :sizes
  resources :crusts
  resources :sauces
  resources :cheeses
  resources :pizzas
  resources :dishes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
