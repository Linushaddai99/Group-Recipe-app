class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /recipe_foods or /recipe_foods.json
  def index
    @foods = @user.recipe_foods.select(:food_id, 'SUM(quantity) as quantity').group(:food_id, :quantity)
    @sum = 0
    @foods.each do |food|
      @sum += food.quantity * food.food.price
    end
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show; end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
    @foods = []
    @ids = RecipeFood.where(recipe_id: params[:recipe_id]).pluck(:food_id)
    Food.all.each do |f|
      @foods << [f.name, f.id] unless @ids.include?(f.id)
    end
  end

  # GET /recipe_foods/1/edit
  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.find_by(recipe_id: recipe_food_params[:recipe_id],
                                      food_id: recipe_food_params[:food_id])

    puts 'Recipe Food'
    puts @recipe_food
    puts recipe_food_params[:quantity]
    puts '--------------'

    if @recipe_food
      @recipe_food.increment!(:quantity, recipe_food_params[:quantity].to_i)
      @recipe_food.save
    else
      recipe_food = RecipeFood.create(recipe_food_params)
      if recipe_food.save
        flash[:sucess] = 'Recipe_food created successfully'
      else
        puts recipe_food
        puts 'NOT SAVED'
      end
    end
    redirect_to recipe_path(params[:recipe_id])
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    @recipe_food = RecipeFood.find(recipe_foods_params)
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html { redirect_to recipe_food_url(@recipe_food), notice: 'Recipe food was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food = Recipe.find(params[:recipe_id]).recipe_foods.find_by(id: params[:id])
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_path(params[:recipe_id]), notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.permit(:quantity, :food_id, :recipe_id)
  end
end
