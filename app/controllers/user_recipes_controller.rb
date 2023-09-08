class UserRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.cuisines.blank? && current_user.dietaries.blank? && current_user.ingredients.blank?
      redirect_to edit_user_preferences_path
    end

    # @recipes = Recipe
    #   .joins(:cuisines).where(cuisines: { id: current_user.cuisine_ids })
    #   .joins(:dietaries).where(dietaries: { id: current_user.dietary_ids })
    #   .joins(:ingredients).where(ingredients: { id: current_user.ingredient_ids })
    #   .distinct

      def index
        @recipes = Recipe.all
        if current_user.cuisine_ids.any?
            @recipes = @recipes.joins(:cuisines).where(cuisines: { id: current_user.cuisine_ids })
        end
        if current_user.dietary_ids.any?
            @recipes = @recipes.joins(:dietaries).where(dietaries: { id: current_user.dietary_ids })
        end
        if current_user.ingredient_ids.any?
            @recipes = @recipes.joins(:ingredients).where(ingredients: { id: current_user.ingredient_ids })
        end
        @recipes = @recipes.distinct
    end
    @recipes = Recipe.all
  end

  def search
    @search_results = Recipe
      .where("name ILIKE ?", "%#{params[:query]}%")
      .where(cuisine: params[:cuisine])
      .where(dietary: params[:dietary])
      .where(ingredients: [:ingredients])
  end

  def show
    @recipes = Recipe.find(params[:id])
  end

  def favourite
    @user_recipe = UserRecipe.find(params[:id])
      if current_user.favourite.include?(@recipe)
        flash[:notice] = "Recipe is already in your favorites"
    else
        current_user.favourite << @recipe
        flash[:success] = "Recipe added to favorites"
    end
    redirect_to @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :time, :instruction, :description)
  end
end
