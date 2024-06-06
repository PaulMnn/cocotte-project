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

recipe = Recipe.new(
  title: 'Spaghetti Bolognese',
  instruction: "1) Faites bouillir une grande casserole d'eau salée et ajoutez 400g de spaghettis.
2) Faites chauffer 2 cuillères à soupe d'huile d'olive dans une grande poêle et faites revenir 1 oignon et 2 gousses d'ail jusqu'à ce qu'ils soient dorés.
3) Ajoutez 500g de viande hachée et faites-la cuire jusqu'à ce qu'elle soit bien dorée.
4) Incorporez 400g de sauce tomate, 1 cuillère à café d'herbes de Provence et assaisonnez avec du sel et du poivre.
5) Laissez mijoter pendant 20 minutes.
6) Égouttez les spaghettis et mélangez-les avec la sauce.
7) Servez chaud avec 50g de parmesan râpé.",
  meal: 'Plat',
  ingredient: "• 400g de spaghettis
• 400g de sauce tomate
• 500g de viande hachée
• 1 oignon
• 2 gousses d'ail
• 2 cuillères à soupe d'huile d'olive
• 1 cuillère à café d'herbes de Provence
• Sel
• Poivre
• 50g de parmesan râpé",
  user: users[0]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496669/eekladnqir10npbnpvua.jpg")
recipe.photo.attach(io: file, filename: "spaghetti.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Salade César',
  instruction: "1) Lavez et séchez 1 laitue romaine.
2) Coupez la laitue en morceaux.
3) Préparez la vinaigrette César en mélangeant 100g de yaourt, 2 cuillères à soupe de jus de citron, 1 cuillère à café de moutarde, 1 gousse d'ail hachée, 50g de parmesan râpé, du sel et du poivre.
4) Mélangez la laitue avec la vinaigrette.
5) Ajoutez 100g de croûtons et mélangez bien.
6) Servez avec des copeaux de parmesan.",
  meal: 'Entrée',
  ingredient: "• 1 laitue romaine
• 100g de yaourt
• 2 cuillères à soupe de jus de citron
• 1 cuillère à café de moutarde
• 1 gousse d'ail
• 50g de parmesan râpé
• 100g de croûtons
• Sel
• Poivre",
  user: users[1]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496668/ntebdfwrkmzweyksj0ie.jpg")
recipe.photo.attach(io: file, filename: "caesar_salad.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Pancakes',
  instruction: "1) Dans un grand bol, mélangez 200g de farine, 50g de sucre, 2 cuillères à café de levure chimique et une pincée de sel.
2) Dans un autre bol, battez 2 œufs et ajoutez 300ml de lait et 50g de beurre fondu.
3) Incorporez les ingrédients liquides aux ingrédients secs jusqu'à obtenir une pâte lisse.
4) Faites chauffer une poêle antiadhésive à feu moyen et graissez-la légèrement.
5) Versez une petite louche de pâte dans la poêle et faites cuire jusqu'à ce que des bulles apparaissent à la surface.
6) Retournez le pancake et faites cuire l'autre côté jusqu'à ce qu'il soit doré.
7) Servez chaud avec du sirop d'érable.",
  meal: 'Brunch',
  ingredient: "• 200g de farine
• 50g de sucre
• 2 cuillères à café de levure chimique
• Une pincée de sel
• 2 œufs
• 300ml de lait
• 50g de beurre fondu
• Sirop d'érable",
  user: users[2]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496667/h4qhuspdjaungxkzejpc.jpg")
recipe.photo.attach(io: file, filename: "pancakes.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Curry de Poulet',
  instruction: "1) Coupez 500g de poulet en morceaux.
2) Faites chauffer 2 cuillères à soupe d'huile dans une poêle et faites revenir 1 oignon jusqu'à ce qu'il soit translucide.
3) Ajoutez 2 gousses d'ail et 1 cuillère à soupe de gingembre râpé et faites revenir pendant 1 minute.
4) Ajoutez les morceaux de poulet et faites-les dorer de tous les côtés.
5) Incorporez 2 cuillères à soupe de curry, 1 cuillère à café de curcuma et 1 cuillère à café de cumin, et faites cuire pendant 2 minutes.
6) Ajoutez 400ml de lait de coco et 400g de tomates concassées.
7) Laissez mijoter pendant 20 minutes.
8) Servez chaud avec du riz basmati.",
  meal: 'Plat',
  ingredient: "• 500g de poulet
• 1 oignon
• 2 gousses d'ail
• 1 cuillère à soupe de gingembre râpé
• 2 cuillères à soupe de curry
• 1 cuillère à café de curcuma
• 1 cuillère à café de cumin
• 400ml de lait de coco
• 400g de tomates concassées
• Riz basmati",
  user: users[3]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496666/ukaz83ebods9ureiskzd.jpg")
recipe.photo.attach(io: file, filename: "chicken_curry.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Smoothie aux Fruits',
  instruction: "1) Pelez et coupez 1 banane en morceaux.
2) Lavez 150g de baies.
3) Mettez la banane, les baies et 200ml de yaourt dans un mixeur.
4) Mixez jusqu'à obtenir une consistance lisse.
5) Versez dans un verre et servez immédiatement.",
  meal: 'Boisson',
  ingredient: "• 1 banane
• 150g de baies
• 200ml de yaourt",
  user: users[4]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496665/ilwpuqmm7tqjjguvcqri.jpg")
recipe.photo.attach(io: file, filename: "fruit_smoothie.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Sandwich au Fromage Grillé',
  instruction: "1) Beurrez une face de chaque tranche de pain (4 tranches).
2) Placez une tranche de fromage (100g) entre deux tranches de pain, côté beurré vers l'extérieur.
3) Faites chauffer une poêle à feu moyen et placez le sandwich dans la poêle.
4) Faites cuire jusqu'à ce que le pain soit doré et croustillant, environ 3 minutes de chaque côté.
5) Servez chaud.",
  meal: 'Snack',
  ingredient: "• 4 tranches de pain
• 100g de fromage
• Beurre",
  user: users[0]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496664/lrywy5b7arspwc7ttxxn.jpg")
recipe.photo.attach(io: file, filename: "grilled_cheese.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Soupe de Tomate',
  instruction: "1) Faites chauffer 2 cuillères à soupe d'huile dans une casserole et faites revenir 1 oignon jusqu'à ce qu'il soit translucide.
2) Ajoutez 2 gousses d'ail et faites revenir pendant 1 minute.
3) Ajoutez 800g de tomates concassées et 500ml de bouillon de légumes.
4) Laissez mijoter pendant 20 minutes.
5) Mixez la soupe jusqu'à ce qu'elle soit lisse.
6) Ajoutez 100ml de crème et assaisonnez avec du sel et du poivre.
7) Servez chaud avec des feuilles de basilic.",
  meal: 'Entrée',
  ingredient: "• 1 oignon
• 2 gousses d'ail
• 800g de tomates concassées
• 500ml de bouillon de légumes
• 100ml de crème
• Sel
• Poivre
• Feuilles de basilic",
  user: users[1]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496663/xphcdhw7pkbezqxqvg4y.jpg")
recipe.photo.attach(io: file, filename: "tomato_soup.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Omelette',
  instruction: "1) Battez 3 œufs dans un bol avec une pincée de sel et de poivre.
2) Faites chauffer 1 cuillère à soupe de beurre dans une poêle à feu moyen.
3) Versez les œufs battus dans la poêle et laissez cuire sans remuer.
4) Lorsque les bords commencent à se solidifier, ajoutez 50g de fromage râpé et 50g de jambon coupé en dés.
5) Pliez l'omelette en deux et continuez à cuire jusqu'à ce que le fromage soit fondu.
6) Servez chaud.",
  meal: 'Brunch',
  ingredient: "• 3 œufs
• Sel
• Poivre
• 1 cuillère à soupe de beurre
• 50g de fromage râpé
• 50g de jambon coupé en dés",
  user: users[2]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496801/q2xc0h5m0gzjmzw4dxfv.jpg")
recipe.photo.attach(io: file, filename: "omelette.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Gâteau au Chocolat',
  instruction: "1) Préchauffez le four à 180°C.
2) Dans un grand bol, mélangez 200g de farine, 50g de cacao en poudre, 150g de sucre et 1 cuillère à café de levure chimique.
3) Ajoutez 3 œufs, 200ml de lait et 100ml d'huile végétale, puis mélangez jusqu'à obtenir une pâte lisse.
4) Versez la pâte dans un moule beurré et fariné.
5) Faites cuire au four pendant 35-40 minutes.
6) Laissez refroidir avant de démouler.
7) Servez avec un glaçage ou de la crème chantilly.",
  meal: 'Dessert',
  ingredient: "• 200g de farine
• 50g de cacao en poudre
• 150g de sucre
• 1 cuillère à café de levure chimique
• 3 œufs
• 200ml de lait
• 100ml d'huile végétale",
  user: users[3]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496660/lcnwozhde7huz3jow1he.jpg")
recipe.photo.attach(io: file, filename: "chocolate_cake.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Steak Grillé',
  instruction: "1) Assaisonnez 2 steaks avec du sel et du poivre des deux côtés.
2) Faites chauffer 2 cuillères à soupe d'huile dans une poêle à feu vif.
3) Placez les steaks dans la poêle et faites cuire selon la cuisson désirée (environ 3-4 minutes de chaque côté pour une cuisson saignante).
4) Laissez reposer les steaks pendant 5 minutes avant de les trancher.
5) Servez avec une sauce au choix et des légumes grillés.",
  meal: 'Plat',
  ingredient: "• 2 steaks
• Sel
• Poivre
• 2 cuillères à soupe d'huile
• Sauce au choix
• Légumes grillés",
  user: users[4]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717496659/ibo8lmadn9updeyolkp1.jpg")
recipe.photo.attach(io: file, filename: "steak.jpg", content_type: "photo/png")
recipe.save

# Create ebooks
ebooks = []

ebook = Ebook.create!(ebook_title: 'PLATS SAINS', theme: 'style 1', user: users[0])
file = URI.open("https://cdn-elle.ladmedia.fr/var/plain_site/storage/images/elle-a-table/fiches-cuisine/tous-les-themes/plats/45279226-4-fre-FR/Recettes-Plats.jpg")
ebook.photo.attach(io: file, filename: "healthy_eating.jpg", content_type: "photo/png")
ebooks << ebook

ebook = Ebook.create!(ebook_title: 'RECETTES RAPIDES', theme: 'style 2', user: users[1])
file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQggsPche_ANQj0pmUUx9L0pBVt7kLbJt5V8Q&s")
ebook.photo.attach(io: file, filename: "quick_recipes.jpg", content_type: "photo/png")
ebooks << ebook

ebook = Ebook.create!(ebook_title: 'PLATS GOURMETS', theme: 'style 1', user: users[2])
file = URI.open("https://cdn-elle.ladmedia.fr/var/plain_site/storage/images/elle-a-table/fiches-cuisine/tous-les-themes/plats/45279226-4-fre-FR/Recettes-Plats.jpg")
ebook.photo.attach(io: file, filename: "healthy_eating.jpg", content_type: "photo/png")
ebooks << ebook

ebook = Ebook.create!(ebook_title: 'DESSERTS', theme: 'style 2', user: users[3])
file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQggsPche_ANQj0pmUUx9L0pBVt7kLbJt5V8Q&s")
ebook.photo.attach(io: file, filename: "quick_recipes.jpg", content_type: "photo/png")
ebooks << ebook

ebook = Ebook.create!(ebook_title: 'VEGETARIEN', theme: 'style 1', user: users[4])
file = URI.open("https://cdn-elle.ladmedia.fr/var/plain_site/storage/images/elle-a-table/fiches-cuisine/tous-les-themes/plats/45279226-4-fre-FR/Recettes-Plats.jpg")
ebook.photo.attach(io: file, filename: "healthy_eating.jpg", content_type: "photo/png")
ebooks << ebook

ebook = Ebook.create!(ebook_title: 'APERETIFS GOURMETS', theme: 'style 2', user: users[1])
file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQggsPche_ANQj0pmUUx9L0pBVt7kLbJt5V8Q&s")
ebook.photo.attach(io: file, filename: "quick_recipes.jpg", content_type: "photo/png")
ebooks << ebook

ebook = Ebook.create!(ebook_title: 'ENTREES', theme: 'style 1', user: users[1])
file = URI.open("https://cdn-elle.ladmedia.fr/var/plain_site/storage/images/elle-a-table/fiches-cuisine/tous-les-themes/plats/45279226-4-fre-FR/Recettes-Plats.jpg")
ebook.photo.attach(io: file, filename: "healthy_eating.jpg", content_type: "photo/png")
ebooks << ebook

ebook = Ebook.create!(ebook_title: 'CUISINE DE MAMIE', theme: 'style 2', user: users[2])
file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQggsPche_ANQj0pmUUx9L0pBVt7kLbJt5V8Q&s")
ebook.photo.attach(io: file, filename: "quick_recipes.jpg", content_type: "photo/png")
ebooks << ebook

ebook = Ebook.create!(ebook_title: 'RECETTES SIMPLES', theme: 'style 1', user: users[1])
file = URI.open("https://cdn-elle.ladmedia.fr/var/plain_site/storage/images/elle-a-table/fiches-cuisine/tous-les-themes/plats/45279226-4-fre-FR/Recettes-Plats.jpg")
ebook.photo.attach(io: file, filename: "healthy_eating.jpg", content_type: "photo/png")
ebooks << ebook

# Create recipages
Recipage.create!(templating: 'Template 1', recipe: Recipe.all.to_a[0], ebook: ebooks[0])
Recipage.create!(templating: 'Template 2', recipe: Recipe.all.to_a[1], ebook: ebooks[1])
Recipage.create!(templating: 'Template 3', recipe: Recipe.all.to_a[2], ebook: ebooks[2])
Recipage.create!(templating: 'Template 4', recipe: Recipe.all.to_a[3], ebook: ebooks[3])
Recipage.create!(templating: 'Template 5', recipe: Recipe.all.to_a[4], ebook: ebooks[4])
Recipage.create!(templating: 'Template 1', recipe: Recipe.all.to_a[5], ebook: ebooks[0])
Recipage.create!(templating: 'Template 2', recipe: Recipe.all.to_a[6], ebook: ebooks[1])
Recipage.create!(templating: 'Template 3', recipe: Recipe.all.to_a[7], ebook: ebooks[2])
Recipage.create!(templating: 'Template 4', recipe: Recipe.all.to_a[8], ebook: ebooks[3])

puts "Seed data created successfully!"
