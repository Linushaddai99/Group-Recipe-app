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

  put '/recipes/:id/toggle_privacy', to: 'recipes#toggle_privacy', as: 'toggle_recipe_privacy'
  

  #get "", to:"users#index", as: 'users'

  # Routes for Inventory
  resources :inventories, only: [:new, :create, :edit, :index, :show, :destroy] do
    resources :inventory_foods, only: [:new, :create, :destroy]
  end

  resources :foods, only: [:new, :index, :show, :create, :destroy]

  #resources :recipes, only: [:new, :create, :edit, :index, :show, :destroy] do
    
  #end

  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end
  
  resources :shopping_list, only: [:index]

  resources :users do
    resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
    resources :inventories, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
  end
  
  # Routes for Is
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #  gets root "articles#index"
end
