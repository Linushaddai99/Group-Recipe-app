first_user = User.create(name:"Shaddai")
first_inventory = Inventory.create(name:"First Bag", user:first_user)
first_food = Food.create(name: "Apple", measurement_unit:"g", price:5)
first_inventory_food = InventoryFood.create(quantity: 5, inventory: first_inventory, food: first_food)
first_recipe = Recipe.create(name: "First Recipe", preparation_time:10, cooking_time:20, description: "First thing to do", public:true, user:first_user)
first_recipe_food = RecipeFood.create(quantity:10, recipe:first_recipe, food:first_food)
