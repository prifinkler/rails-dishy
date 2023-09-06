# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning up database..."
# RecipeIngredient.destroy_all

RecipeDietary.destroy_all
RecipeCuisine.destroy_all
RecipeIngredient.destroy_all
Recipe.destroy_all

UserDietary.destroy_all
UserCuisine.destroy_all
UserIngredient.destroy_all
User.destroy_all

Dietary.destroy_all
Cuisine.destroy_all
Ingredient.destroy_all


puts "Database cleaned"


dietaries = [
  { dietary_type: 'Vegan' },
  { dietary_type: 'Vegetarian' },
  { dietary_type: 'Pescatarian' },
  { dietary_type: 'Gluten-free' },
  { dietary_type: 'Dairy-free' },
  { dietary_type: 'Nut allergy' },
  { dietary_type: 'Lactose intolerant' },
  { dietary_type: 'Keto' },
  { dietary_type: 'Paleo' },
  { dietary_type: 'Low-carb' },
  { dietary_type: 'Low-fat' },
  { dietary_type: 'High-protein' },
  { dietary_type: 'Mediterranean' },
  { dietary_type: 'Halal' },
  { dietary_type: 'Kosher' },
  { dietary_type: 'Whole30' },
  { dietary_type: 'No added sugar' }
]

dietaries.each do |dietary|
  Dietary.create(dietary_type: dietary[:dietary_type])
end
puts "Dietary types created!"

cuisines = [
  { name: 'Italian' },
  { name: 'Chinese' },
  { name: 'Mexican' },
  { name: 'Indian' },
  { name: 'Japanese' },
  { name: 'French' },
  { name: 'Greek' },
  { name: 'Thai' },
  { name: 'Spanish' },
  { name: 'American' },
  { name: 'Mediterranean' },
  { name: 'Middle Eastern' },
  { name: 'Vietnamese' },
  { name: 'Korean' },
  { name: 'Cajun' },
  { name: 'Brazilian' },
  { name: 'African' }
]

cuisines.each do |cuisine|
  Cuisine.create(name: cuisine[:name])
end
puts "Cuisines created!"

ingredients = [
  { name: 'Tomato' },
  { name: 'Chicken' },
  { name: 'Salt' },
  { name: 'Onion' },
  { name: 'Garlic' },
  { name: 'Olive oil' },
  { name: 'Pepper' },
  { name: 'Spaghetti' },
  { name: 'Rice' },
  { name: 'Beef' },
  { name: 'Lemon' },
  { name: 'Butter' },
  { name: 'Cilantro' },
  { name: 'Milk' },
  { name: 'Egg' },
  { name: 'Cheese' },
  { name: 'Bread' },
  { name: 'Cucumber' },
  { name: 'Carrot' },
  { name: 'Bell pepper' },
  { name: 'Thyme' },
  { name: 'Rosemary' },
  { name: 'Basil' },
  { name: 'Cumin' },
  { name: 'Paprika' },
  { name: 'Ginger' },
  { name: 'Soy sauce' },
  { name: 'Fish sauce' },
  { name: 'Honey' },
  { name: 'Brown sugar' },
  { name: 'Cayenne pepper' },
  { name: 'Cinnamon' },
  { name: 'Vanilla extract' },
  { name: 'Red onion' },
  { name: 'Green onion' },
  { name: 'Spinach' },
  { name: 'Mushroom' },
  { name: 'Celery' },
  { name: 'Lime' },
  { name: 'Coconut milk' },
  { name: 'Lettuce' },
  { name: 'Sour cream' },
  { name: 'Salsa' },
  { name: 'Bacon' },
  { name: 'Parmesan cheese' },
  { name: 'Black pepper' },
  { name: 'Tortilla' },
  { name: 'Ground beef' }
]

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient[:name])
end
puts "Ingredients created!"

spaghetti_carbonara = Recipe.create!(
  name: 'Spaghetti Carbonara',
  time: 30
)

spaghetti_carbonara.ingredients << Ingredient.find_by(name: "Spaghetti")
spaghetti_carbonara.ingredients << Ingredient.find_by(name: "Egg")
spaghetti_carbonara.ingredients << Ingredient.find_by(name: "Bacon")
spaghetti_carbonara.ingredients << Ingredient.find_by(name: "Parmesan cheese")
spaghetti_carbonara.ingredients << Ingredient.find_by(name: "Black pepper")
spaghetti_carbonara.ingredients << Ingredient.find_by(name: "Salt")

spaghetti_carbonara.cuisines << Cuisine.find_by(name: "Italian")
spaghetti_carbonara.dietaries << Dietary.find_by(dietary_type: "Vegetarian")

tacos = Recipe.create!(
  name: 'Tacos',
  time: 45
)

tacos.ingredients << Ingredient.find_by(name: "Tortilla")
tacos.ingredients << Ingredient.find_by(name: "Ground beef")
tacos.ingredients << Ingredient.find_by(name: "Lettuce")
tacos.ingredients << Ingredient.find_by(name: "Tomato")
tacos.ingredients << Ingredient.find_by(name: "Cheese")
tacos.ingredients << Ingredient.find_by(name: "Sour cream")
tacos.ingredients << Ingredient.find_by(name: "Salsa")

tacos.cuisines << Cuisine.find_by(name: "Mexican")
tacos.dietaries << Dietary.find_by(dietary_type: "Pescatarian")

puts "Recipes created!"

User.create!(
  email: 'user@gmail.com',
  password: '123456'
)

# RecipeIngredient.create!(recipe_id: Recipe.last.id, ingredient_id: Ingredient.last.id)
puts "done"
