class DietariesController < ApplicationController
  def index
    @dietaries = Dietaries.all
  end

  def show
    @dietary= Dietary.find(params[:id])
    @recipes = @dietary.recipes
    # @recipes = Recipe.with_dietary_preferences(current_user.dietary_ids)
    #               .where(dietary_id: @dietary.id)
  end

  def update
    @ingredient_ids = params[:ingredient_ids]
    current_user.ingredient_ids = @ingredient_ids
    redirect_to recipes_path, notice: "Ingredient preferences updated!"
  end
end
