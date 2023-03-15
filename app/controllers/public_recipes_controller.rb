class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes([:user], [:recipes_foods]).where(public: true).order(created_at: :desc)
    @public_recipes.each do |recipe|
      recipe.recipes_foods.all.includes([:food]).sort_by { |recipe_food| recipe_food.food.name }
    end
  end
end
