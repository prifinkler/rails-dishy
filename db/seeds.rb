# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning up database..."
RecipeIngredient.destroy_all
Recipe.destroy_all
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
  { name: 'Pasta' },
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
  { name: 'Coconut milk' }
]

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient[:name])
end
puts "Ingredients created!"

recipes = [
  { name: 'Recipe 1', time: 10 },
  { name: 'Recipe 2', time: 20  },
  { name: 'Recipe 3', time: 30 }
]

recipe1 = Recipe.create!(
  name: 'Spaghetti Carbonara',
  time: 30
)

recipe2 = Recipe.create!(
  name: 'Tacos',
  time: 45
)

puts "Recipes created!"

RecipeIngredient.create!(recipe_id: Recipe.last.id, ingredient_id: Ingredient.last.id)
puts "done"
