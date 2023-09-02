class CuisinesController < ApplicationController
  def index
    @cuisines = Cuisine.all
  end

  def show
    @cuisine = Cuisine.find(params[:id])
    @recipes = @cuisine.recipes
  end

  def update
    @cuisine_ids = params[:cuisine_ids]
    current_user.cuisine_ids = @cuisine_ids
    redirect_to recipes_path, notice: "Cuisine preferences updated!"
  end

end
