class UserPreferencesController < ApplicationController
  before_action :authenticate_user!

  def edit_cuisines
    @user = current_user
  end

  def update_cuisines
    @user = current_user
    if @user.update(user_cuisines_params)
      redirect_to edit_user_dietaries_path
    else
      render :edit_cuisines
    end
  end

  # def edit_ingredients
  #   @user = current_user
  # end

  # def update_ingredients
  #   @user = current_user
  #   if @user.update(user_ingredients_params)
  #     redirect_to edit_user_dietaries_path
  #   else
  #     render :edit_ingredients
  #   end
  # end

  def edit_dietaries
    @user = current_user
  end

  def update_dietaries
    @user = current_user
    if @user.update(user_dietaries)
      redirect_to recipes_path
    else
      render :edit_dietaries
    end
  end

  private

  def user_cuisines_params
    params.require(:user).permit(cuisine_ids: [])
  end

  def user_ingredients_params
    params.require(:user).permit(ingredient_ids: [])
  end

  def user_dietaries
    params.require(:user).permit(dietary_ids: [])
  end
end
