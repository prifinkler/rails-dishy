Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # On the URL this will appear as /profile/cuisines, etc:
  namespace :profile do
    get 'cuisines', to: 'user_cuisines#index'
    put 'cuisines', to: 'user_cuisines#update'

    get 'dietaries', to: 'user_dietaries#index'
    put 'dietaries', to: 'user_dietaries#update'

    get 'ingredients', to: 'user_ingredients#index'
    put 'ingredients', to: 'user_ingredients#update'
  end

  # Route to show the user's favourite recipes:
  resources :user_recipes, only: [] do
    get 'favorite_recipes', on: :collection, to: 'user_recipes#index_favorites'
  end

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
