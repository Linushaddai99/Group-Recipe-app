class ShoppingListsController < ApplicationController
  def index
    @final_food = []
    @total = 0

    @food_of_inventory = InventoryFood.includes(:food).where(inventory_id: params[:inventory_id])
    @food_of_recipe = RecipeFood.includes(:food).where(recipe_id: params[:recipe_id])

    @food_of_recipe.each do |first_food|
      k = 0
      @food_of_inventory.each do |second_food|
        next unless first_food.food.name == second_food.food.name

        k = 1
        if second_food.quantity < first_food.quantity
          final_quantity = first_food.quantity - second_food.quantity
          @final_food << { name: second_food.food.name, quantity: final_quantity, price: second_food.food.price }
        end
      end
      @final_food << { name: first_food.food.name, quantity: first_food.quantity, price: first_food.food.price } if k.zero?
    end

    @final_food.each do |item|
      @total += item[:quantity] * item[:price]
    end
  end
end
