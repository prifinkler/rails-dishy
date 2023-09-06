class UserPreferencesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_preferences_params)
      redirect_to user_recipes_path, notice: "Preferences saved successfully."
    else
      render :edit
    end
  end

  private

  def user_preferences_params
    params.require(:user).permit(cuisine_ids: [], ingredient_ids: [], dietary_ids: [])
  end
end
