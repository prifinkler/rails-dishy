class RecipesUsersController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def search
    @search_results = Recipe.where("name ILIKE ?", "%#{params[:query]}%")
  end

  def show
    @recipes = Recipe.find(params[:id])
  end

  def favourite
    @recipe = Recipe.find(params[:id])
      unless current_user.favourite.include?(@recipe)
      current_user.favourite << @recipe
      flash[:success] = "Recipe added to favorites"
    else
      flash[:notice] = "Recipe is already in your favorites"
    end
      redirect_to @recipe
  end

private

  def recipe_params
    params.require(:recipe).permit(:name, :portion, :time)
  end
end
