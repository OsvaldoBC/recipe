Rails.application.routes.draw do
  get 'recipes', to: 'recipes#index', as: 'recipes'
  get 'recipes_public', to: 'recipes#public', as: 'recipes_public'
  get 'recipes/new', to: 'recipes#new', as: 'recipes_new'
  post 'recipes/new', to: 'recipes#create', as: 'recipes_create'
  get 'recipes/:id', to: 'recipes#show', as: 'recipes_show'
  patch 'recipes/:id', to: 'recipes#update', as: 'recipes_update'
  delete 'recipes/:id', to: 'recipes#destroy', as: 'delete_recipe'
  post 'recipe_food/new', to: 'recipe_food#create', as: 'recipe_food_create'
  delete 'recipe_food/:id', to: 'recipe_food#destroy', as: 'recipe_food_delete'
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'recipes#index', as: 'root'
  get '/foods', to: 'foods#index'
  get '/foods/new', to: 'foods#new', as: 'new_food'
  post '/foods/new', to: 'foods#create', as: 'create_food'
  delete '/foods/:id', to: 'foods#destroy', as: 'delete_food'

  get 'recipes', to: 'recipes#index', as: 'recipes'
  get 'recipes_public', to: 'recipes#public', as: 'recipes_public'
  get 'recipes/new', to: 'recipes#new', as: 'recipes_new'
  post 'recipes/new', to: 'recipes#create', as: 'recipes_create'
  get 'recipes/:id', to: 'recipes#show', as: 'recipes_show'
  delete 'recipes/:id', to: 'recipes#destroy', as: 'delete_recipe'

  get 'shopping_list', to: 'shopping_list#index', as: 'shopping_list'
end