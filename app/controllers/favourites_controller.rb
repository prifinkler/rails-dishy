class FavouritesController < ApplicationController
  before_action :authenticate_user!

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
    @recipe = Recipe.find(params[:recipe_id])
    existing_favourite = Favourite.find_by(user: current_user, recipe: @recipe)

    if existing_favourite
      respond_to do |format|
        format.json { render json: { message: "Recipe already in favorites" }, status: :unprocessable_entity }
      end
    else
      @favourite = Favourite.new(user: current_user, recipe: @recipe)

      respond_to do |format|
        if @favourite.save
          format.json { render json: @favourite, status: :created }
        else
          format.json { render json: @favourite.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @favourite.destroy
  end

  private

  def favourite_params
    params.require(:favourite).permit(:recipe_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_favourite
    # @favourite = current_user.favourites.find(params[:id])
    @favourite = Favourite.find(params[:id])
  end
end
