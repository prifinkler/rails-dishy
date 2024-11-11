class UserPreferencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: %i[edit_time update_time]
  before_action :set_user_time, only: %i[edit_time update_time]
  def edit_cuisines
  end

  def update_cuisines
    if @user.update(user_cuisines_params)
      redirect_to edit_user_dietaries_path
    else
      render :edit_cuisines
    end
  end

  # def edit_ingredients
  # end

  # def update_ingredients
  #   if @user.update(user_ingredients_params)
  #     redirect_to edit_user_dietaries_path
  #   else
  #     render :edit_ingredients
  #   end
  # end

  def edit_dietaries
  end

  def update_dietaries
    if @user.update(user_dietaries_params)
      redirect_to edit_user_time_path
    else
      render :edit_dietaries
    end
  end

  def edit_time
  end

  def update_time
    if @user_time.update(user_time_params)
      redirect_to recipes_path
    else
      render :edit_time
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_user_time
    @user_time = current_user.user_time || current_user.build_user_time
  end

  def user_cuisines_params
    params.require(:user).permit(cuisine_ids: [])
  end

  # def user_ingredients_params
  #   params.require(:user).permit(ingredient_ids: [])
  # end

  def user_dietaries_params
    params.require(:user).permit(dietary_ids: [])
  end

  def user_time_params
    params.require(:user_time).permit(:max_cooking_time)
  end
end
