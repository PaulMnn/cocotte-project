# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

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

recipe = Recipe.new(title: 'Spaghetti Bolognese', instruction: 'Cook pasta, add sauce.', meal: 'Dinner', ingredient: 'Pasta, Tomato Sauce, Ground Beef', user: users[0])
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496669/eekladnqir10npbnpvua.jpg")
recipe.photo.attach(io: file, filename: "spaghetti.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(title: 'Caesar Salad', instruction: 'Mix lettuce, add dressing.', meal: 'Lunch', ingredient: 'Lettuce, Caesar Dressing, Croutons', user: users[1])
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496668/ntebdfwrkmzweyksj0ie.jpg")
recipe.photo.attach(io: file, filename: "caesar_salad.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(title: 'Pancakes', instruction: 'Mix ingredients, cook on griddle.', meal: 'Breakfast', ingredient: 'Flour, Eggs, Milk, Syrup', user: users[2])
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496667/h4qhuspdjaungxkzejpc.jpg")
recipe.photo.attach(io: file, filename: "pancakes.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(title: 'Chicken Curry', instruction: 'Cook chicken, add curry sauce.', meal: 'Dinner', ingredient: 'Chicken, Curry Powder, Coconut Milk', user: users[3])
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496666/ukaz83ebods9ureiskzd.jpg")
recipe.photo.attach(io: file, filename: "chicken_curry.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(title: 'Fruit Smoothie', instruction: 'Blend all ingredients.', meal: 'Snack', ingredient: 'Banana, Berries, Yogurt', user: users[4])
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496665/ilwpuqmm7tqjjguvcqri.jpg")
recipe.photo.attach(io: file, filename: "fruit_smoothie.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(title: 'Grilled Cheese Sandwich', instruction: 'Grill bread and cheese.', meal: 'Lunch', ingredient: 'Bread, Cheese, Butter', user: users[0])
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496664/lrywy5b7arspwc7ttxxn.jpg")
recipe.photo.attach(io: file, filename: "grilled_cheese.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(title: 'Tomato Soup', instruction: 'Heat tomatoes, blend.', meal: 'Lunch', ingredient: 'Tomatoes, Cream, Basil', user: users[1])
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496663/xphcdhw7pkbezqxqvg4y.jpg")
recipe.photo.attach(io: file, filename: "tomato_soup.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(title: 'Omelette', instruction: 'Whisk eggs, cook in pan.', meal: 'Breakfast', ingredient: 'Eggs, Cheese, Ham', user: users[2])
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496801/q2xc0h5m0gzjmzw4dxfv.jpg")
recipe.photo.attach(io: file, filename: "omelette.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(title: 'Chocolate Cake', instruction: 'Mix ingredients, bake.', meal: 'Snack', ingredient: 'Flour, Cocoa, Sugar', user: users[3])
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496660/lcnwozhde7huz3jow1he.jpg")
recipe.photo.attach(io: file, filename: "chocolate_cake.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(title: 'Steak', instruction: 'Season steak, grill.', meal: 'Dinner', ingredient: 'Steak, Salt, Pepper', user: users[4])
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496659/ibo8lmadn9updeyolkp1.jpg")
recipe.photo.attach(io: file, filename: "steak.jpg", content_type: "photo/png")
recipe.save

# Create ebooks
ebooks = []

ebook = Ebook.create!(ebook_title: 'Healthy Eating', theme: 'Health', user: users[0])
file = URI.open("https://cdn-elle.ladmedia.fr/var/plain_site/storage/images/elle-a-table/fiches-cuisine/tous-les-themes/plats/45279226-4-fre-FR/Recettes-Plats.jpg")
ebook.photo.attach(io: file, filename: "healthy_eating.jpg", content_type: "photo/png")
ebooks << ebook

ebook = Ebook.create!(ebook_title: 'Quick Recipes', theme: 'Fast', user: users[1])
file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQggsPche_ANQj0pmUUx9L0pBVt7kLbJt5V8Q&s")
ebook.photo.attach(io: file, filename: "quick_recipes.jpg", content_type: "photo/png")
ebooks << ebook

# Create recipages
Recipage.create!(templating: 'Template 1', recipe: Recipe.all.to_a[0], ebook: ebooks[0])
Recipage.create!(templating: 'Template 2', recipe: Recipe.all.to_a[1], ebook: ebooks[1])
# Recipage.create!(templating: 'Template 3', recipe: Recipe.all.to_a[2], ebook: ebooks[2])
# Recipage.create!(templating: 'Template 4', recipe: Recipe.all.to_a[3], ebook: ebooks[3])
# Recipage.create!(templating: 'Template 5', recipe: Recipe.all.to_a[4], ebook: ebooks[4])
# Recipage.create!(templating: 'Template 1', recipe: Recipe.all.to_a[5], ebook: ebooks[0])
# Recipage.create!(templating: 'Template 2', recipe: Recipe.all.to_a[6], ebook: ebooks[1])
# Recipage.create!(templating: 'Template 3', recipe: Recipe.all.to_a[7], ebook: ebooks[2])
# Recipage.create!(templating: 'Template 4', recipe: Recipe.all.to_a[8], ebook: ebooks[3])
# Recipage.create!(templating: 'Template 5', recipe: Recipe.all.to_a[9], ebook: ebooks[4])

puts "Seed data created successfully!"
