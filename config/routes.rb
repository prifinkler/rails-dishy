Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'user_preferences/edit', to: 'user_preferences#edit', as: 'edit_user_preferences'
  patch 'user_preferences/update', to: 'user_preferences#update', as: 'update_user_preferences'


  # Route to show the user's recipes:
  resources :user_recipes, only: %i[index edit update destroy]

  # Routes for favourite and search:
  resources :recipes, only: %i[index show] do
    member do
      post 'favorite', to: 'user_recipes#favorite'
    end
    collection do
      get 'search', to: 'user_recipes#search'
    end
  end
end
