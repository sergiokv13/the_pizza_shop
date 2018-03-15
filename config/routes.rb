Rails.application.routes.draw do
  get '/dishes/next_state/:id/:delivery' => "dishes#next_state"
  get '/pizza/:id/ingredients' => "pizzas#ingredients"
  get '/pizza/:id/:ingredient_id' => "pizzas#add_ingredient"

  resources :non_pizzas
  resources :pizza_types
  resources :ingredients
  resources :sizes
  resources :crusts
  resources :sauces
  resources :cheeses
  resources :pizzas
  resources :dishes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
