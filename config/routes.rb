Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'user_preferences/edit_cuisines', to: 'user_preferences#edit_cuisines', as: 'edit_user_cuisines'
  patch 'user_preferences/update_cuisines', to: 'user_preferences#update_cuisines', as: 'update_user_cuisines'

  get 'user_preferences/edit_ingredients', to: 'user_preferences#edit_ingredients', as: 'edit_user_ingredients'
  patch 'user_preferences/update_ingredients', to: 'user_preferences#update_ingredients', as: 'update_user_ingredients'

  get 'user_preferences/edit_dietaries', to: 'user_preferences#edit_dietaries', as: 'edit_user_dietaries'
  patch 'user_preferences/update_dietaries', to: 'user_preferences#update_dietaries', as: 'update_user_dietaries'


  # Route to show the user's recipes:
  resources :user_recipes, only: %i[index edit update destroy]

  # Routes for favourite and search:
  resources :recipes, only: %i[index show] do
    member do
      post 'favourite', to: 'user_recipes#favourite'
    end
    collection do
      get 'search', to: 'user_recipes#search'
    end
  end
end
