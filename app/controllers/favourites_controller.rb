class UserRecipesController < ApplicationController
  def index
    @recipes = Recipe
    .joins(:cuisine).where(cuisines:[current_user.cuisines])
    .joins(:dietary).where(dietaries:[current_user.dietaries])
    .joins(:ingredient).where(ingredients: [current_user.ingredients])
  end

  def search
  @search_results = Recipe.where("name ILIKE ?", "%#{params[:query]}%")
      .where(cuisine: params[:cuisine])
      .where(dietary: params[:dietary])
      .where(ingredients: {:ingredients})
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
