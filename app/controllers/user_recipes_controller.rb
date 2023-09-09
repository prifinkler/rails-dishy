class UserRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.cuisines.blank? && current_user.dietaries.blank? && current_user.ingredients.blank?
      redirect_to edit_user_preferences_path
    end

    @recipes = Recipe.all
    if current_user.cuisines
      @recipes = @recipes.joins(:cuisines).where(cuisines: current_user.cuisines)
    end

    if current_user.ingredients
      @recipes = @recipes.select do |recipe|
        current_user.ingredient_ids & recipe.ingredient_ids == current_user.ingredient_ids
      end
    end

    if current_user.dietaries
      @recipes = @recipes.select do |recipe|
        current_user.dietary_ids & recipe.dietary_ids == current_user.dietary_ids
      end
    end
  end



  def search
    @search_results = Recipe.all

    if params[:cuisine].present?
      @search_results = @search_results.where(cuisine: params[:cuisine])
    end

    if params[:dietary].present?
      @search_results = @search_results.where(dietary: params[:dietary])
    end

    if params[:ingredient].present?
      @search_results = @search_results.where(ingredient: params[:ingredient])
    end
    render 'search'
  end

  def show
    @recipes = Recipe.find(params[:id])
  end

  def favourite
    @favourites = []
    recipe = Recipe.find(params[:id])
    @favourites << recipe
    current_user.recipes << recipe
    # current_user.save
    # @favourites << recipe
    redirect_to user_recipes_path
  end

  def unfavourite
    recipe = Recipe.find(params[:id])
    current_user.recipes.delete(recipe)
    current_user.save
    redirect_to user_recipes_path
  end

  def favourite_index
    @recipes = current_user.favourites
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :time, :instruction, :description)
  end
end
