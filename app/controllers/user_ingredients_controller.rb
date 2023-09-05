class UserIngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[edit update destroy]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user = current_user
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @ingredient = params[:ingredient]
    current_user.ingredient = @ingredient
    redirect_to ingredients_path, notice: "Ingredient preferences updated!"
  end

  # def destroy
  #   @ingredient.destroy
  #   redirect_to ingredients_path, status: :see_other
  # end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
