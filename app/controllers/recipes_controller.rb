class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def search
    @search_results = Recipe.where("name ILIKE ?", "%#{params[:query]}%")
  end

  def show
    @recipes = Recipes.find(params[:id])
  end

  def favourite
    @recipe = Recipe.find(params[:id])
    current_user.favourites << @recipe
    redirect_to @recipe
  end

private

  def recipe_params
    params.require(:recipe).permit(:name, :portion, :time)
  end
end
