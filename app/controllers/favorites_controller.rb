class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorited_by_type('Recipe')
  end

  def destroy
    favorite = Recipe.find(params[:id])
    if current_user.unfavorite(favorite)
      render json: { status: 'success' }
    else
      render json: { status: 'error' }, status: :unprocessable_entity
    end
  end
end
