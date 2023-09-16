class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:create]

  def index
    @user = current_user
    @favorites = @user.all_favorites
  end

  # def create
  #   @recipe = Recipe.find(params[:recipe_id])
  #   existing_favorite = current_user.favorite?(@recipe) # Check if user has already favorited

  #   if existing_favorite
  #     respond_to do |format|
  #       format.json { render json: { message: "Recipe already in favorites" }, status: :unprocessable_entity }
  #     end
  #   else
  #     @favorite = current_user.favorite(@recipe) # Use 'favorite' method from 'acts_as_favouritor'

  #     respond_to do |format|
  #       if @favorite
  #         format.json { render json: @favorite, status: :created }
  #         format.html { redirect_to @recipe, notice: 'Recipe favorited!' }
  #       else
  #         format.json { render json: @favorite.errors, status: :unprocessable_entity }
  #         format.html { redirect_to @recipe, alert: 'Failed to favorite the recipe.' }
  #       end
  #     end
  #   end
  # end

  # def destroy
  #   @recipe = Recipe.find(params[:recipe_id])
  #   if current_user.unfavorite(@recipe) # Use 'unfavorite' method from 'acts_as_favouritor'
  #     respond_to do |format|
  #       format.html { redirect_to @recipe, notice: 'Recipe unfavorited!' }
  #       format.json { head :no_content }
  #     end
  #   else
  #     respond_to do |format|
  #       format.html { redirect_to @recipe, alert: 'Failed to unfavorite the recipe.' }
  #       format.json { render json: { message: 'Unfavoriting failed' }, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # private

  # def set_recipe
  #   @recipe = Recipe.find(params[:recipe_id])
  # end
end
