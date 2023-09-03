class UserRecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  # def index_favorites
  #   @favorite_recipes = current_user.favorite_recipes
  #   # Add logic to display the favorite recipes in the view
  # end

  def search
    @search_results = Recipe.where("name ILIKE ?", "%#{params[:query]}%")
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
