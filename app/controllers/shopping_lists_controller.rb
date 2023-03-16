class ShoppingListsController < ApplicationController
  def index
    @sum = 0
    missing_food_id = current_user.inventories.includes(:inventory_foods).pluck(:food_id) - current_user.recipes.includes(:recipe_foods).pluck(:food_id)
    @foods = InventoryFood.includes([:food]).where(food_id: missing_food_id)
    @foods.each do |food|
      @sum += food.quantity * food.food.price
    end
  end
end
