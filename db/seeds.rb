# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning up database..."
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all
puts "Database cleaned"
recipes = [
  { name: 'Recipe 1', time: 10 },
  { name: 'Recipe 2', time: 20  },
  { name: 'Recipe 3', time: 30 }
]

recipes.each do |recipe|
  Recipe.create(name: recipe[:name], time: recipe[:time])
  puts "recipe created!"
end

ingredients =[{name: "mushrooms"},
{name: "rice"}]

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient[:name])
  puts "ingredient created!"
end

RecipeIngredient.create!(recipe_id: Recipe.last.id, ingredient_id: Ingredient.last.id)
puts "done"
