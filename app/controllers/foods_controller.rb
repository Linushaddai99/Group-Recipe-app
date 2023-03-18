class FoodsController < ApplicationController
  # before_action :set_food, only: %i[new show destroy]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  def new
    @user = current_user
    @food = Food.new
  end

  def show; end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @user = current_user
    @food = Food.new(food_params)
    # @food.user = @user
    if @food.save
      redirect_to inventories_path, notice: 'Food was successfully created.'
    else
      render :new, alert: 'Food was not created.'
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def food_params
    # params.fetch(:food, {})
    params.require(:food).permit(:name, :measurement_unit, :price, current_user.id)
  end
end
