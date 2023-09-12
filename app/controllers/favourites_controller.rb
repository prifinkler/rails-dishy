class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[destroy]
  before_action :set_recipe, only: %i[new create]

  def index
    @favourites = current_user.favourites
  end

  # def show
  # @favourtie = Favourite.find(params[:id])
  # end


  def new
    @favourite = Favourite.new
  end

  def create
    @favourite = current_user.favourites.create(favourite_params)
    # @favourite = Favourite.new(favourite_params)
    @favourite.recipe = @recipe
    if @favourite.save
      redirect_to recipe_path(@favourite.recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @favourite.destroy
    redirect_to recipes_path(@favourite.recipe), status: :see_other
  end
  private

  def favourite_params
    params.require(:favourite).permit(:recipe_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_favourite
    @favourite = current_user.favourites.find(params[:id])
    # @favourite = Favourite.find(params[:id])
  end

end
