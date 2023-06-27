Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/create'
  get 'recipes/delete'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
