class ShoppingListsController < ApplicationController
  def index
    # @foods = current_user.recipe_foods.select(:food_id, 'SUM(quantity) as quantity').group(:food_id, :quantity)
    @sum = 0
    # recipe_foods = current_user.recipe_foods.select(:food_id, 'SUM(quantity) as quantity').group(:food_id, :quantity)
    # inventory_foods = current_user.inventory_foods.select(:food_id, 'SUM(quantity) as quantity').group(:food_id, :quantity)
    missing_food_id = current_user.inventories.includes(:inventory_foods).pluck(:food_id) - current_user.recipes.includes(:recipe_foods).pluck(:food_id)
    @foods = InventoryFood.includes([:food]).where(food_id: missing_food_id)
    @foods.each do |food|
      @sum += food.quantity * food.food.price
    end
  end
end
