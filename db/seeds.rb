# first_user = User.create(name:"Shaddai", email: 'shaddai@gmail.com', password: '12345678')
# second_user = User.create(name:"Mert", email: 'mert@gmail.com', password: '12345678')

# first_inventory = Inventory.create(name:"First Inventory", user_id:first_user.id)
# second_inventory = Inventory.create(name:"Second Inventory", user_id:first_user.id)
# third_inventory = Inventory.create(name:"Third Inventory", user_id:first_user.id)
# fourth_inventory = Inventory.create(name:"Fourth Inventory", user_id:second_user.id)

# puts 'adds inventory data on first_user'

# first_food = Food.create(name: "Apple", measurement_unit:"g", price:5)
# second_food = Food.create(name: "Rice", measurement_unit:"g", price:10)
# third_food = Food.create(name: "Oat", measurement_unit:"g", price:25)
# fourth_food = Food.create(name: "Beans", measurement_unit:"g", price:35)

# InventoryFood.create(quantity: 5, inventory_id: first_inventory.id, food_id: first_food.id)
# InventoryFood.create(quantity: 10, inventory_id: first_inventory.id, food_id: second_food.id)
# InventoryFood.create(quantity: 3, inventory_id: first_inventory.id, food_id: third_food.id)
# InventoryFood.create(quantity: 90, inventory_id: first_inventory.id, food_id: fourth_food.id)

# InventoryFood.create(quantity: 5, inventory_id: second_inventory.id, food_id: first_food.id)
# InventoryFood.create(quantity: 3, inventory_id: second_inventory.id, food_id: second_food.id)
# InventoryFood.create(quantity: 6, inventory_id: second_inventory.id, food_id: third_food.id)
# InventoryFood.create(quantity: 5, inventory_id: second_inventory.id, food_id: fourth_food.id)

# InventoryFood.create(quantity: 5, inventory_id: third_inventory.id, food_id: first_food.id)
# InventoryFood.create(quantity: 7, inventory_id: third_inventory.id, food_id: second_food)

# InventoryFood.create(quantity: 10, inventory_id: fourth_inventory.id, food_id: third_food.id)
# InventoryFood.create(quantity: 5, inventory_id: fourth_inventory.id, food_id: fourth_food.id)

# first_recipe = Recipe.create(name: "First Recipe", preparation_time:10, cooking_time:20, description: "First thing to do", public:true, user_id:first_user.id)
# second_recipe = Recipe.create(name: "Second Recipe", preparation_time:20, cooking_time:50, description: "This is how make this dish", public:false, user:first_user.id)
# third_recipe = Recipe.create(name: "Third Recipe", preparation_time:30, cooking_time:10, description: "First thing to do", public:true, user_id:first_user.id)
# fourth_recipe = Recipe.create(name: "fourth Recipe", preparation_time:5, cooking_time:20, description: "First thing to do", public:false, user_id:first_user.id)

# RecipeFood.create(quantity:10, recipe_id:first_recipe.id, food_id:first_food.id)
# RecipeFood.create(quantity:30, recipe_id:first_recipe.id, food_id:second_food.id)
# RecipeFood.create(quantity:20, recipe_id:first_recipe.id, food_id:third_food.id)
# RecipeFood.create(quantity:60, recipe_id:first_recipe.id, food_id:fourth_food.id)

# RecipeFood.create(quantity:80, recipe_id:second_recipe.id, food_id:first_food.id)
# RecipeFood.create(quantity:10, recipe_id:second_recipe.id, food_id:second_food).id
# RecipeFood.create(quantity:30, recipe_id:second_recipe.id, food_id:third_food.id)
# RecipeFood.create(quantity:10, recipe_id:second_recipe.id, food_id:fourth_food.id)

# RecipeFood.create(quantity:5, recipe_id:third_recipe.id, food_id:first_food.id)
# RecipeFood.create(quantity:16, recipe_id:third_recipe.id, food_id:second_food.id)
# RecipeFood.create(quantity:29, recipe_id:third_recipe.id, food_id:third_food.id)
# RecipeFood.create(quantity:10, recipe_id:third_recipe.id, food_id:fourth_food.id)

# RecipeFood.create(quantity:10, recipe_id:fourth_recipe.id, food_id:first_food.id)
# RecipeFood.create(quantity:38, recipe_id:fourth_recipe.id, food_id:second_food.id)
# RecipeFood.create(quantity:76, recipe_id:fourth_recipe.id, food_id:third_food.id)
# RecipeFood.create(quantity:99, recipe_id:fourth_recipe.id, food_id:fourth_food.id)

