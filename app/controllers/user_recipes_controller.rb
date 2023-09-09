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

    @recipes = Recipe.all
    if current_user.cuisines
      @recipes = @recipes.joins(:cuisines).where(cuisines: current_user.cuisines)
    end

    if current_user.ingredients

      # @recipes = @recipes.joins(:ingredients).where(ingredients: current_user.ingredients)
      raise
      @recipes = @recipes.select { |recipe| recipe.ingredients.include?(current_user.ingredients) }
    end

    if current_user.dietaries
      @recipes = @recipes.joins(:dietaries).where(dietaries: current_user.dietaries)
    end


    @recipes = @recipes.distinct
  end



  def search
    @search_results = Recipe.all

    if params[:query].present?
      @search_results = @search_results.where("name ILIKE ?", "%#{params[:query]}%")
    end

    if params[:cuisine].present?
      @search_results = @search_results.where(cuisine: params[:cuisine])
    end

    if params[:dietary].present?
      @search_results = @search_results.where(dietary: params[:dietary])
    end

    if params[:ingredient].present?
      @search_results = @search_results.where("ingredients LIKE ?", "%#{params[:ingredient]}%")
    end
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
