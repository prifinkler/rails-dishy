# class UserDietariesController < ApplicationController
#   before_action :set_dietary, only: %i[edit update destroy]

#   def index
#     @dietarys = Dietary.all
#   end

#   # def new
#   #   @dietary = Dietary.new
#   # end

#   # def create
#   #   @dietary = Dietary.new(dietary_params)
#   #   @dietary.user = current_user
#   #   if @dietary.save
#   #     redirect_to dietary_path(@dietary)
#   #   else
#   #     render :new, status: :unprocessable_entity
#   #   end
#   # end

#   def edit
#   end

#   def update
#     @dietary = params[:dietary]
#     current_user.dietary = @dietary
#     redirect_to dietary_path, notice: "Dietary preferences updated!"
#   end

#   # def destroy
#   #   @dietary.destroy
#   #   redirect_to dietary_path, status: :see_other
#   # end

#   private

#   def set_dietary
#     @dietary = Dietary.find(params[:id])
#   end

#   def dietary_params
#     params.require(:dietary).permit(:dietary_type)
#   end

# end
