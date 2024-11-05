class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
    if current_user.cuisines.present?
      @recipes = @recipes.joins(:cuisines).where(cuisines: current_user.cuisines)
    end

    if current_user.ingredients.present?
      @recipes = @recipes.select do |recipe|
        current_user.ingredient_ids & recipe.ingredient_ids == current_user.ingredient_ids
      end
    end

    if current_user.dietaries.present?
      @recipes = @recipes.select do |recipe|
        current_user.dietary_ids & recipe.dietary_ids == current_user.dietary_ids
      end
    end
  end

  def toggle_favorite
    @recipe = Recipe.find(params[:id])
    current_user.favorited?(@recipe) ? current_user.unfavorite(@recipe) : current_user.favorite(@recipe)

    respond_to do |format|
      format.html { redirect_to @recipe }
      format.json { render json: { status: 'success', message: 'Favorite status toggled.' } }
    end
  end

  def search
    if params[:q].present?
      recipes_by_name_and_time = Recipe.search_by_name_and_time(params[:q])
      recipes_by_ingredients = Recipe.search_by_ingredients(params[:q])
      recipes_by_cuisines = Recipe.search_by_cuisines(params[:q])

      @recipes = recipes_by_name_and_time + recipes_by_ingredients + recipes_by_cuisines
      if @recipes.empty?
        flash.now[:notice] = "No recipes found matching '#{params[:q]}'"
      end
    else
      @recipes = []
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    # session[:last_viewed_recipe_id] = @recipe.id
    # puts "Last Viewed Recipe ID: #{session[:last_viewed_recipe_id]}" #  debugging
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :time, :instruction, :description, :photo_url)
  end
end
