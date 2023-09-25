Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"

  get 'about_us', to: 'pages#about_us'

  get 'user_preferences/edit_cuisines', to: 'user_preferences#edit_cuisines', as: 'edit_user_cuisines'
  patch 'user_preferences/update_cuisines', to: 'user_preferences#update_cuisines', as: 'update_user_cuisines'

  # get 'user_preferences/edit_ingredients', to: 'user_preferences#edit_ingredients', as: 'edit_user_ingredients'
  # patch 'user_preferences/update_ingredients', to: 'user_preferences#update_ingredients', as: 'update_user_ingredients'

  get 'user_preferences/edit_dietaries', to: 'user_preferences#edit_dietaries', as: 'edit_user_dietaries'
  patch 'user_preferences/update_dietaries', to: 'user_preferences#update_dietaries', as: 'update_user_dietaries'

  get 'recipes/search', to: 'recipes#search', as: 'search_recipes'

  # Route to show the user's recipes:
  resources :recipes, only: %i[index show] do
    collection do
      get :search
    end
    member do
      post 'toggle_favorite', to: "recipes#toggle_favorite"
    end
  end

  resources :favorites, only: %i[index create destroy]

end
