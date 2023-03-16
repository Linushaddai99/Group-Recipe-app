Rails.application.routes.draw do
  devise_for :users
  # resources :recipes
  # resources :recipe_foods
  # resources :foods
  # resources :inventory_foods
  root "inventories#index"
  # Routes for public recepes
  get '/public_recipes', to: 'public_recipes#index'
  # Routes for shopping list
  get '/shopping_list', to: 'shopping_lists#index'


  #get "", to:"users#index", as: 'users'

  # Routes for Inventory
  resources :inventories, only: [:new, :create, :edit, :index, :show, :destroy] do

  end

  # Routes for Recipes
  resources :recipes, only: [:new, :create, :edit, :index, :show, :destroy] do
  
  end
  
  resources :shopping_list, only: [:index]
  
  # Routes for Is
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #  gets root "articles#index"
end
