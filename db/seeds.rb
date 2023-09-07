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
  { name: 'Eggplant' },
  { name: 'Zucchini' },
  { name: 'Tomatoes' },
  { name: 'Olive oil' },
  { name: 'Salt' },
  { name: 'Pepper' },
  { name: 'Onions' },
  { name: 'Garlic' },
  { name: 'Crushed tomatoes' },
  { name: 'Basil' },
  { name: 'Thyme' },
  { name: 'Cucumbers' },
  { name: 'Cherry tomatoes' },
  { name: 'Red onion' },
  { name: 'Kalamata olives' },
  { name: 'Feta cheese' },
  { name: 'Extra virgin olive oil' },
  { name: 'Dried oregano' },
  { name: 'Soy sauce' },
  { name: 'Wasabi' },
  { name: 'Pickled ginger' },
  { name: 'Rice noodles' },
  { name: 'Vegetable oil' },
  { name: 'Shrimp' },
  { name: 'Tofu' },
  { name: 'Egg' },
  { name: 'Fish sauce' },
  { name: 'Tamarind paste' },
  { name: 'Sugar' },
  { name: 'Bean sprouts' },
  { name: 'Chopped peanuts' },
  { name: 'Lime wedges' },
  { name: 'Cilantro' },
  { name: 'Nori seaweed' },
  { name: 'Sushi rice' },
  { name: 'Avocado' },
  { name: 'Cucumber' },
  { name: 'Cooked shrimp' },
  { name: 'Soy sauce' },
  { name: 'Wasabi' },
  { name: 'Pickled ginger' },
  { name: 'Olive oil' },
  { name: 'Onions' },
  { name: 'Garlic' },
  { name: 'Bell peppers' },
  { name: 'Saffron threads' },
  { name: 'Paprika' },
  { name: 'Rice' },
  { name: 'Chicken broth' },
  { name: 'White wine' },
  { name: 'Sausages' },
  { name: 'Chicken' },
  { name: 'Seafood' },
  { name: 'Lemon wedges' },
  { name: 'Fresh parsley' },
  { name: 'Pork shoulder' },
  { name: 'Barbecue spice rub' },
  { name: 'Cabbage' },
  { name: 'Carrots' },
  { name: 'Coleslaw dressing' },
  { name: 'Barbecue sauce' },
  { name: 'Hamburger buns' },
  { name: 'Sushi rice' },
  { name: 'Cucumber' },
  { name: 'Carrot' },
  { name: 'Avocado' },
  { name: 'Soy sauce' },
  { name: 'Rice vinegar' },
  { name: 'Sugar' },
  { name: 'Nori seaweed' },
  { name: 'Sesame seeds' },
  { name: 'Pickled ginger' }
]

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient[:name])
end
puts "Ingredients created!"

# spaghetti_carbonara = Recipe.create!(
#   name: 'Spaghetti Carbonara',
#   time: 30
# )

# spaghetti_carbonara.ingredients << Ingredient.find_by(name: "Spaghetti")
# spaghetti_carbonara.ingredients << Ingredient.find_by(name: "Egg")
# spaghetti_carbonara.ingredients << Ingredient.find_by(name: "Bacon")
# spaghetti_carbonara.ingredients << Ingredient.find_by(name: "Parmesan cheese")
# spaghetti_carbonara.ingredients << Ingredient.find_by(name: "Black pepper")
# spaghetti_carbonara.ingredients << Ingredient.find_by(name: "Salt")

# spaghetti_carbonara.cuisines << Cuisine.find_by(name: "Italian")
# spaghetti_carbonara.dietaries << Dietary.find_by(dietary_type: "Vegetarian")

# tacos = Recipe.create!(
#   name: 'Tacos',
#   time: 45
# )

# tacos.ingredients << Ingredient.find_by(name: "Tortilla")
# tacos.ingredients << Ingredient.find_by(name: "Ground beef")
# tacos.ingredients << Ingredient.find_by(name: "Lettuce")
# tacos.ingredients << Ingredient.find_by(name: "Tomato")
# tacos.ingredients << Ingredient.find_by(name: "Cheese")
# tacos.ingredients << Ingredient.find_by(name: "Sour cream")
# tacos.ingredients << Ingredient.find_by(name: "Salsa")

# tacos.cuisines << Cuisine.find_by(name: "Mexican")
# tacos.dietaries << Dietary.find_by(dietary_type: "Pescatarian")

# puts "Recipes created!"

margarita_pizza = Recipe.create!(
  name: 'Classic Margherita Pizza',
  description: 'Enjoy the simplicity and flavors of a classic Margherita pizza.',
  time: 30,
  instruction: '1. Preheat your oven to 475°F (245°C).
                2. Roll out the pizza dough into a thin circle.
                3. Spread tomato sauce over the dough.
                4. Add slices of fresh mozzarella cheese.
                5. Sprinkle with fresh basil leaves and a drizzle of olive oil.
                6. Bake in the oven for 10-12 minutes or until the crust is golden and the cheese is bubbly.
                7. Slice and serve hot.'
)
margarita_pizza.ingredients << Ingredient.find_or_create_by(name: "Pizza dough")
margarita_pizza.ingredients << Ingredient.find_or_create_by(name: "Tomato sauce")
margarita_pizza.ingredients << Ingredient.find_or_create_by(name: "Fresh mozzarella cheese")
margarita_pizza.ingredients << Ingredient.find_or_create_by(name: "Fresh basil leaves")
margarita_pizza.ingredients << Ingredient.find_or_create_by(name: "Olive oil")
margarita_pizza.ingredients << Ingredient.find_or_create_by(name: "Salt")
margarita_pizza.ingredients << Ingredient.find_or_create_by(name: "Black pepper")

Recipe.last.cuisines << Cuisine.find_by(name: "Italian")
Recipe.last.dietaries << Dietary.find_by(dietary_type: "Vegetarian")

# Recipe 2
stir_fried_chicken_with_broccoli = Recipe.create!(
  name: 'Stir-Fried Chicken with Broccoli',
  description: 'A quick and healthy stir-fry with tender chicken and crisp broccoli.',
  time: 25,
  instruction: '1. Heat oil in a pan or wok over high heat.
                2. Add diced chicken and stir-fry until cooked through.
                3. Remove the chicken and set it aside.
                4. In the same pan, stir-fry broccoli florets until they turn bright green.
                5. Return the chicken to the pan.
                6. Add soy sauce, garlic, and ginger. Stir-fry for an additional 2 minutes.
                7. Serve hot over steamed rice.'
)

stir_fried_chicken_with_broccoli.ingredients << Ingredient.find_or_create_by(name: "Chicken")
stir_fried_chicken_with_broccoli.ingredients << Ingredient.find_or_create_by(name: "Broccoli")
stir_fried_chicken_with_broccoli.ingredients << Ingredient.find_or_create_by(name: "Soy sauce")
stir_fried_chicken_with_broccoli.ingredients << Ingredient.find_or_create_by(name: "Garlic")
stir_fried_chicken_with_broccoli.ingredients << Ingredient.find_or_create_by(name: "Ginger")
stir_fried_chicken_with_broccoli.ingredients << Ingredient.find_or_create_by(name: "Cooked rice")
stir_fried_chicken_with_broccoli.ingredients << Ingredient.find_or_create_by(name: "Oil")

Recipe.last.cuisines << Cuisine.find_by(name: "Chinese")
Recipe.last.dietaries << Dietary.find_by(dietary_type: "High-protein")

# Recipe 3
vegetable_curry = Recipe.create!(
  name: 'Vegetable Curry',
  description: 'A flavorful and aromatic vegetable curry that is perfect for vegetarians.',
  time: 40,
  instruction: '1. Heat oil in a large pot and sauté onions until translucent.
                2. Add garlic, ginger, and curry paste. Cook for 2 minutes.
                3. Stir in diced vegetables (e.g., carrots, bell peppers, and potatoes).
                4. Pour in coconut milk and vegetable broth.
                5. Simmer until vegetables are tender.
                6. Season with salt, pepper, and lime juice.
                7. Serve over rice or with naan bread.'
                )

vegetable_curry.ingredients << Ingredient.find_or_create_by(name: "Onion")
vegetable_curry.ingredients << Ingredient.find_or_create_by(name: "Garlic")
vegetable_curry.ingredients << Ingredient.find_or_create_by(name: "Ginger")
vegetable_curry.ingredients << Ingredient.find_or_create_by(name: "Curry paste")
vegetable_curry.ingredients << Ingredient.find_or_create_by(name: "Carrots")
vegetable_curry.ingredients << Ingredient.find_or_create_by(name: "Bell pepper")
vegetable_curry.ingredients << Ingredient.find_or_create_by(name: "Potatoes")
vegetable_curry.ingredients << Ingredient.find_or_create_by(name: "Coconut milk")
vegetable_curry.ingredients << Ingredient.find_or_create_by(name: "Vegetable broth")
vegetable_curry.ingredients << Ingredient.find_or_create_by(name: "Lime juice")
vegetable_curry.ingredients << Ingredient.find_or_create_by(name: "Salt")
vegetable_curry.ingredients << Ingredient.find_or_create_by(name: "Black pepper")

Recipe.last.cuisines << Cuisine.find_by(name: "Indian")
Recipe.last.dietaries << Dietary.find_by(dietary_type: "Vegan")

# Recipe 4
sushi_rolls = Recipe.create!(
  name: 'Sushi Rolls',
  description: 'Create your own sushi rolls with fresh ingredients and nori seaweed.',
  time: 45,
  instruction: '1. Place a sheet of nori on a bamboo sushi mat.
                2. Spread a layer of sushi rice over the nori, leaving a border at the top.
                3. Add your choice of fillings (e.g., avocado, cucumber, and cooked shrimp).
                4. Roll the nori tightly using the mat.
                5. Slice into bite-sized pieces.
                6. Serve with soy sauce, wasabi, and pickled ginger.'
)

sushi_rolls.ingredients << Ingredient.find_or_create_by(name: "Nori seaweed")
sushi_rolls.ingredients << Ingredient.find_or_create_by(name: "Sushi rice")
sushi_rolls.ingredients << Ingredient.find_or_create_by(name: "Avocado")
sushi_rolls.ingredients << Ingredient.find_or_create_by(name: "Cucumber")
sushi_rolls.ingredients << Ingredient.find_or_create_by(name: "Cooked shrimp")
sushi_rolls.ingredients << Ingredient.find_or_create_by(name: "Soy sauce")
sushi_rolls.ingredients << Ingredient.find_or_create_by(name: "Wasabi")
sushi_rolls.ingredients << Ingredient.find_or_create_by(name: "Pickled ginger")

Recipe.last.cuisines << Cuisine.find_by(name: "Japanese")
Recipe.last.dietaries << Dietary.find_by(dietary_type: "Pescatarian")

# Recipe 5
ratatouille = Recipe.create!(
  name: 'Ratatouille',
  description: 'A traditional French Provençal stewed vegetable dish.',
  time: 50,
  instruction: '1. Heat olive oil in a large pot.
                2. Sauté onions, garlic, and bell peppers until softened.
                3. Add diced tomatoes, eggplant, zucchini, and herbs.
                4. Cook over low heat until vegetables are tender.
                5. Season with salt and pepper.
                6. Serve hot as a side dish or with crusty bread.'
)
ratatouille.ingredients << Ingredient.find_or_create_by(name: "Eggplant")
ratatouille.ingredients << Ingredient.find_or_create_by(name: "Zucchini")
ratatouille.ingredients << Ingredient.find_or_create_by(name: "Tomatoes")
ratatouille.ingredients << Ingredient.find_or_create_by(name: "Olive oil")
ratatouille.ingredients << Ingredient.find_or_create_by(name: "Salt")
ratatouille.ingredients << Ingredient.find_or_create_by(name: "Pepper")
ratatouille.ingredients << Ingredient.find_or_create_by(name: "Onions")
ratatouille.ingredients << Ingredient.find_or_create_by(name: "Garlic")
ratatouille.ingredients << Ingredient.find_or_create_by(name: "Crushed tomatoes")
ratatouille.ingredients << Ingredient.find_or_create_by(name: "Basil")
ratatouille.ingredients << Ingredient.find_or_create_by(name: "Thyme")

Recipe.last.cuisines << Cuisine.find_by(name: "French")
Recipe.last.dietaries << Dietary.find_by(dietary_type: "Vegetarian")

# Recipe 6
greek_salad = Recipe.create!(
  name: 'Greek Salad',
  description: 'A refreshing and healthy salad with Mediterranean flavors.',
  time: 15,
  instruction: '1. In a large bowl, combine diced cucumbers, tomatoes, and red onions.
                2. Add black olives and crumbled feta cheese.
                3. Drizzle with olive oil and sprinkle with dried oregano.
                4. Season with salt and pepper.
                5. Toss to combine and serve chilled.'
)

greek_salad.ingredients << Ingredient.find_or_create_by(name: "Cucumbers")
greek_salad.ingredients << Ingredient.find_or_create_by(name: "Cherry tomatoes")
greek_salad.ingredients << Ingredient.find_or_create_by(name: "Red onion")
greek_salad.ingredients << Ingredient.find_or_create_by(name: "Kalamata olives")
greek_salad.ingredients << Ingredient.find_or_create_by(name: "Feta cheese")
greek_salad.ingredients << Ingredient.find_or_create_by(name: "Extra virgin olive oil")
greek_salad.ingredients << Ingredient.find_or_create_by(name: "Dried oregano")
greek_salad.ingredients << Ingredient.find_or_create_by(name: "Salt")
greek_salad.ingredients << Ingredient.find_or_create_by(name: "Black pepper")

Recipe.last.cuisines << Cuisine.find_by(name: "Greek")
Recipe.last.dietaries << Dietary.find_by(dietary_type: "Mediterranean")

# Recipe 7
pad_thai = Recipe.create!(
  name: 'Pad Thai',
  description: 'A classic Thai noodle dish with a perfect balance of sweet, sour, and savory flavors.',
  time: 35,
  instruction: '1. Soak rice noodles in hot water until softened, then drain.
                2. Heat oil in a wok or large pan.
                3. Add shrimp and tofu; cook until shrimp turns pink.
                4. Push ingredients to one side and scramble eggs in the pan.
                5. Add noodles, followed by tamarind sauce, fish sauce, and sugar.
                6. Stir-fry until well mixed.
                7. Add bean sprouts and chopped peanuts.
                8. Serve with lime wedges and cilantro.'
)

pad_thai.ingredients << Ingredient.find_or_create_by(name: "Rice noodles")
pad_thai.ingredients << Ingredient.find_or_create_by(name: "Vegetable oil")
pad_thai.ingredients << Ingredient.find_or_create_by(name: "Garlic")
pad_thai.ingredients << Ingredient.find_or_create_by(name: "Shrimp")
pad_thai.ingredients << Ingredient.find_or_create_by(name: "Tofu")
pad_thai.ingredients << Ingredient.find_or_create_by(name: "Egg")
pad_thai.ingredients << Ingredient.find_or_create_by(name: "Fish sauce")
pad_thai.ingredients << Ingredient.find_or_create_by(name: "Tamarind paste")
pad_thai.ingredients << Ingredient.find_or_create_by(name: "Sugar")
pad_thai.ingredients << Ingredient.find_or_create_by(name: "Bean sprouts")
pad_thai.ingredients << Ingredient.find_or_create_by(name: "Chopped peanuts")
pad_thai.ingredients << Ingredient.find_or_create_by(name: "Lime wedges")
pad_thai.ingredients << Ingredient.find_or_create_by(name: "Cilantro")

Recipe.last.cuisines << Cuisine.find_by(name: "Thai")
Recipe.last.dietaries << Dietary.find_by(dietary_type: "Pescatarian")

# Recipe 8
spanish_paella = Recipe.create!(
  name: 'Spanish Paella',
  description: 'A flavorful Spanish rice dish with saffron, seafood, and chicken.',
  time: 60,
  instruction: '1. Heat olive oil in a paella pan.
                2. Sauté onions, garlic, and bell peppers.
                3. Add diced chicken and cook until browned.
                4. Stir in saffron, paprika, and rice; cook for 2 minutes.
                5. Pour in chicken broth and simmer for 20 minutes.
                6. Add seafood (e.g., shrimp, mussels) and peas.
                7. Cover and cook until seafood is cooked through.
                8. Garnish with lemon wedges.'
)

spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Olive oil")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Onions")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Garlic")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Bell peppers")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Saffron threads")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Paprika")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Rice")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Chicken broth")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "White wine")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Sausages")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Chicken")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Seafood")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Lemon wedges")
spanish_paella.ingredients << Ingredient.find_or_create_by(name: "Fresh parsley")

Recipe.last.cuisines << Cuisine.find_by(name: "Spanish")
Recipe.last.dietaries << Dietary.find_by(dietary_type: "Pescatarian")

# Recipe 9
bbq_pulled_pork_sandwich = Recipe.create!(
  name: 'BBQ Pulled Pork Sandwich',
  description: 'Tender pulled pork with smoky BBQ sauce, served in a soft bun.',
  time: 8 * 60,  # 8 hours for slow cooking
  instruction: '1. Rub pork shoulder with a dry spice rub.
                2. Slow-cook the pork in a smoker or oven at low heat for 8 hours.
                3. Shred the cooked pork with two forks.
                4. Mix with BBQ sauce.
                5. Toast buns and assemble sandwiches.
                6. Serve with coleslaw and pickles.'
)
bbq_pulled_pork_sandwich.ingredients << Ingredient.find_or_create_by(name: "Pork shoulder")
bbq_pulled_pork_sandwich.ingredients << Ingredient.find_or_create_by(name: "Barbecue spice rub")
bbq_pulled_pork_sandwich.ingredients << Ingredient.find_or_create_by(name: "Cabbage")
bbq_pulled_pork_sandwich.ingredients << Ingredient.find_or_create_by(name: "Carrots")
bbq_pulled_pork_sandwich.ingredients << Ingredient.find_or_create_by(name: "Coleslaw dressing")
bbq_pulled_pork_sandwich.ingredients << Ingredient.find_or_create_by(name: "Barbecue sauce")
bbq_pulled_pork_sandwich.ingredients << Ingredient.find_or_create_by(name: "Hamburger buns")

Recipe.last.cuisines << Cuisine.find_by(name: "American")
Recipe.last.dietaries << Dietary.find_by(dietary_type: "Halal")

# Recipe 10
vegetable_sushi_bowl = Recipe.create!(
  name: 'Vegetable Sushi Bowl',
  description: 'A deconstructed sushi bowl with a variety of fresh vegetables.',
  time: 25,
  instruction: '1. Cook sushi rice according to package instructions and let it cool.
                2. Arrange sushi rice in bowls.
                3. Top with sliced avocado, cucumber, carrots, and pickled ginger.
                4. Drizzle with soy sauce and sesame seeds.
                5. Serve as a healthy and colorful meal.'
)

vegetable_sushi_bowl.ingredients << Ingredient.find_or_create_by(name: "Sushi rice")
vegetable_sushi_bowl.ingredients << Ingredient.find_or_create_by(name: "Cucumber")
vegetable_sushi_bowl.ingredients << Ingredient.find_or_create_by(name: "Carrot")
vegetable_sushi_bowl.ingredients << Ingredient.find_or_create_by(name: "Avocado")
vegetable_sushi_bowl.ingredients << Ingredient.find_or_create_by(name: "Soy sauce")
vegetable_sushi_bowl.ingredients << Ingredient.find_or_create_by(name: "Rice vinegar")
vegetable_sushi_bowl.ingredients << Ingredient.find_or_create_by(name: "Sugar")
vegetable_sushi_bowl.ingredients << Ingredient.find_or_create_by(name: "Nori seaweed")
vegetable_sushi_bowl.ingredients << Ingredient.find_or_create_by(name: "Sesame seeds")
vegetable_sushi_bowl.ingredients << Ingredient.find_or_create_by(name: "Pickled ginger")

Recipe.last.cuisines << Cuisine.find_by(name: "Japanese")
Recipe.last.dietaries << Dietary.find_by(dietary_type: "Vegetarian")

puts "10 recipes created!"

User.create!(
  email: 'user@gmail.com',
  password: '123456'
)

# RecipeIngredient.create!(recipe_id: Recipe.last.id, ingredient_id: Ingredient.last.id)
puts "done"
