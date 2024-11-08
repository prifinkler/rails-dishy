class UserIngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[edit update destroy]
end
