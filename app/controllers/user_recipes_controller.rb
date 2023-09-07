class UserRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    # separate queries for each preference type and then combine the results
    # cuisine_recipes = Recipe.joins(:cuisines).where(cuisines: { id: current_user.cuisine_ids })
    # dietary_recipes = Recipe.joins(:dietaries).where(dietaries: { id: current_user.dietary_ids })
    # ingredient_recipes = Recipe.joins(:ingredients).where(ingredients: { id: current_user.ingredient_ids })
    # @recipes = cuisine_recipes & dietary_recipes & ingredient_recipes

    # Distinct method ensures that the result contains unique recipes:
    @recipes = Recipe.joins(:cuisines, :dietaries, :ingredients)
    .where('cuisines.id IN (?) OR dietaries.id IN (?) OR ingredients.id IN (?)',
      current_user.cuisine_ids,
      current_user.dietary_ids,
      current_user.ingredient_ids)
    .distinct
  end

  def search
    @search_results = Recipe
      .where("name ILIKE ?", "%#{params[:query]}%")
      .where(cuisine: params[:cuisine])
      .where(dietary: params[:dietary])
      .where(ingredients: [:ingredients])
  end

  def show
    @recipes = Recipe.find(params[:id])
  end

  def favourite
    @recipe = Recipe.find(params[:id])
    if current_user.favourite.include?(@recipe)
      flash[:notice] = "Recipe is already in your favorites"
    else
      current_user.favourite << @recipe
      flash[:success] = "Recipe added to favorites"
    end
    redirect_to @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :time)
  end
end
