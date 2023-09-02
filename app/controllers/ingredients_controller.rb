class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = @cuisine.recipes
  #   @recipes = Recipe.with_ingredient_preferences(current_user.ingredient_ids)
  #               .where(ingredient_id: @ingredient.id)
  end

  def update_preferences
    # Code to update user's ingredient preferences
    @ingredient_ids = params[:ingredient_ids]
    current_user.ingredient_ids = @ingredient_ids
    redirect_to recipes_path, notice: "Ingredient preferences updated!"
  end
end
