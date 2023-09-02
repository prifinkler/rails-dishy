class UserCuisinesController < ApplicationController
  before_action :set_cuisine, only: %i[edit update destroy]

  def index
    @cuisines = Cuisine.all
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    @cuisine.user = current_user
    if @cuisine.save
      redirect_to cuisine_path(@cuisine)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @cuisine = params[:cuisine]
    current_user.cuisine = @cuisine
    redirect_to recipes_path, notice: "Cuisine preferences updated!"
  end

  def destroy
    @cuisine.destroy
    redirect_to cuisines_path, status: :see_other
  end

  private

  def set_cuisine
    @cuisine = Cuisine.find(params[:id])
  end

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end

end

end
