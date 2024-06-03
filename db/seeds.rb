# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Destroying Database...'
Recipage.destroy_all
Ebook.destroy_all
Recipe.destroy_all
User.destroy_all

# Create users
users = []
users << User.create!(email: 'user1@example.com', password: 'password123', password_confirmation: 'password123')
users << User.create!(email: 'user2@example.com', password: 'password123', password_confirmation: 'password123')
users << User.create!(email: 'user3@example.com', password: 'password123', password_confirmation: 'password123')
users << User.create!(email: 'user4@example.com', password: 'password123', password_confirmation: 'password123')
users << User.create!(email: 'user5@example.com', password: 'password123', password_confirmation: 'password123')

# Create recipes
recipes = []
recipes << Recipe.create!(title: 'Spaghetti Bolognese', instruction: 'Cook pasta, add sauce.', meal: 'Dinner', image: 'spaghetti.jpg', ingredient: 'Pasta, Tomato Sauce, Ground Beef', user: users[0])
recipes << Recipe.create!(title: 'Caesar Salad', instruction: 'Mix lettuce, add dressing.', meal: 'Lunch', image: 'caesar_salad.jpg', ingredient: 'Lettuce, Caesar Dressing, Croutons', user: users[1])
recipes << Recipe.create!(title: 'Pancakes', instruction: 'Mix ingredients, cook on griddle.', meal: 'Breakfast', image: 'pancakes.jpg', ingredient: 'Flour, Eggs, Milk, Syrup', user: users[2])
recipes << Recipe.create!(title: 'Chicken Curry', instruction: 'Cook chicken, add curry sauce.', meal: 'Dinner', image: 'chicken_curry.jpg', ingredient: 'Chicken, Curry Powder, Coconut Milk', user: users[3])
recipes << Recipe.create!(title: 'Fruit Smoothie', instruction: 'Blend all ingredients.', meal: 'Snack', image: 'fruit_smoothie.jpg', ingredient: 'Banana, Berries, Yogurt', user: users[4])
recipes << Recipe.create!(title: 'Grilled Cheese Sandwich', instruction: 'Grill bread and cheese.', meal: 'Lunch', image: 'grilled_cheese.jpg', ingredient: 'Bread, Cheese, Butter', user: users[0])
recipes << Recipe.create!(title: 'Tomato Soup', instruction: 'Heat tomatoes, blend.', meal: 'Lunch', image: 'tomato_soup.jpg', ingredient: 'Tomatoes, Cream, Basil', user: users[1])
recipes << Recipe.create!(title: 'Omelette', instruction: 'Whisk eggs, cook in pan.', meal: 'Breakfast', image: 'omelette.jpg', ingredient: 'Eggs, Cheese, Ham', user: users[2])
recipes << Recipe.create!(title: 'Chocolate Cake', instruction: 'Mix ingredients, bake.', meal: 'Snack', image: 'chocolate_cake.jpg', ingredient: 'Flour, Cocoa, Sugar', user: users[3])
recipes << Recipe.create!(title: 'Steak', instruction: 'Season steak, grill.', meal: 'Dinner', image: 'steak.jpg', ingredient: 'Steak, Salt, Pepper', user: users[4])

# Create ebooks
ebooks = []
ebooks << Ebook.create!(ebook_title: 'Healthy Eating', theme: 'Health', user: users[0])
ebooks << Ebook.create!(ebook_title: 'Quick Recipes', theme: 'Fast', user: users[1])
ebooks << Ebook.create!(ebook_title: 'Gourmet Meals', theme: 'Gourmet', user: users[2])
ebooks << Ebook.create!(ebook_title: 'Desserts', theme: 'Sweet', user: users[3])
ebooks << Ebook.create!(ebook_title: 'Vegetarian Dishes', theme: 'Vegetarian', user: users[4])

# Create recipages
Recipage.create!(templating: 'Template 1', recipe: recipes[0], ebook: ebooks[0])
Recipage.create!(templating: 'Template 2', recipe: recipes[1], ebook: ebooks[1])
Recipage.create!(templating: 'Template 3', recipe: recipes[2], ebook: ebooks[2])
Recipage.create!(templating: 'Template 4', recipe: recipes[3], ebook: ebooks[3])
Recipage.create!(templating: 'Template 5', recipe: recipes[4], ebook: ebooks[4])
Recipage.create!(templating: 'Template 1', recipe: recipes[5], ebook: ebooks[0])
Recipage.create!(templating: 'Template 2', recipe: recipes[6], ebook: ebooks[1])
Recipage.create!(templating: 'Template 3', recipe: recipes[7], ebook: ebooks[2])
Recipage.create!(templating: 'Template 4', recipe: recipes[8], ebook: ebooks[3])
Recipage.create!(templating: 'Template 5', recipe: recipes[9], ebook: ebooks[4])

puts "Seed data created successfully!"
