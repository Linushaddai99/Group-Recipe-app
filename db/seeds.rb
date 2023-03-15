first_user = User.create(name:"Shaddai", email: 'shaddai@gmail.com', password: '12345678')
second_user = User.create(name:"Mert", email: 'mert@gmail.com', password: '12345678')

first_inventory = Inventory.create(name:"First Inventory", user:first_user)
second_inventory = Inventory.create(name:"Second Inventory", user:first_user)
third_inventory = Inventory.create(name:"Third Inventory", user:first_user)
fourth_inventory = Inventory.create(name:"Fourth Inventory", user:first_user)

first_food = Food.create(name: "Apple", measurement_unit:"g", price:5)
second_food = Food.create(name: "Rice", measurement_unit:"g", price:10)
third_food = Food.create(name: "Oat", measurement_unit:"g", price:25)
fourth_food = Food.create(name: "Beans", measurement_unit:"g", price:35)

InventoryFood.create(quantity: 5, inventory: first_inventory, food: first_food)
InventoryFood.create(quantity: 10, inventory: first_inventory, food: second_food)
InventoryFood.create(quantity: 3, inventory: first_inventory, food: third_food)
InventoryFood.create(quantity: 90, inventory: first_inventory, food: fourth_food)

InventoryFood.create(quantity: 5, inventory: second_inventory, food: first_food)
InventoryFood.create(quantity: 3, inventory: second_inventory, food: second_food)
InventoryFood.create(quantity: 6, inventory: second_inventory, food: third_food)
InventoryFood.create(quantity: 5, inventory: second_inventory, food: fourth_food)

InventoryFood.create(quantity: 5, inventory: third_inventory, food: first_food)
InventoryFood.create(quantity: 7, inventory: third_inventory, food: second_food)

InventoryFood.create(quantity: 10, inventory: fourth_inventory, food: third_food)
InventoryFood.create(quantity: 5, inventory: fourth_inventory, food: fourth_food)

first_recipe = Recipe.create(name: "First Recipe", preparation_time:10, cooking_time:20, description: "First thing to do", public:true, user:first_user)
second_recipe = Recipe.create(name: "Second Recipe", preparation_time:20, cooking_time:50, description: "This is how make this dish", public:false, user:first_user)
third_recipe = Recipe.create(name: "Third Recipe", preparation_time:30, cooking_time:10, description: "First thing to do", public:true, user:first_user)
fourth_recipe = Recipe.create(name: "fourth Recipe", preparation_time:5, cooking_time:20, description: "First thing to do", public:false, user:first_user)

RecipeFood.create(quantity:10, recipe:first_recipe, food:first_food)
RecipeFood.create(quantity:30, recipe:first_recipe, food:second_food)
RecipeFood.create(quantity:20, recipe:first_recipe, food:third_food)
RecipeFood.create(quantity:60, recipe:first_recipe, food:fourth_food)

RecipeFood.create(quantity:80, recipe:second_recipe, food:first_food)
RecipeFood.create(quantity:10, recipe:second_recipe, food:second_food)
RecipeFood.create(quantity:30, recipe:second_recipe, food:third_food)
RecipeFood.create(quantity:10, recipe:second_recipe, food:fourth_food)

RecipeFood.create(quantity:5, recipe:third_recipe, food:first_food)
RecipeFood.create(quantity:16, recipe:third_recipe, food:second_food)
RecipeFood.create(quantity:29, recipe:third_recipe, food:third_food)
RecipeFood.create(quantity:10, recipe:third_recipe, food:fourth_food)

RecipeFood.create(quantity:10, recipe:fourth_recipe, food:first_food)
RecipeFood.create(quantity:38, recipe:fourth_recipe, food:second_food)
RecipeFood.create(quantity:76, recipe:fourth_recipe, food:third_food)
RecipeFood.create(quantity:99, recipe:fourth_recipe, food:fourth_food)
