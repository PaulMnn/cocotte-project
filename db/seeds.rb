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
  title: 'Lasagnes saumon/épinards',
  instruction: "1) Faites revenir l'oignon et l'ail hachés dans l'huile d'olive jusqu'à ce qu'ils soient dorés. Ajoutez les épinards, assaisonnez avec sel, poivre et muscade, et faites cuire jusqu'à ce qu'ils soient fanés. Réservez.
  2) Coupez le saumon en petits dés, mélangez avec la crème fraîche, salez et poivrez.
  3) Préchauffez le four à 180°C. Étalez une couche de béchamel au fond d'un plat à gratin, ajoutez des feuilles de lasagnes, une couche d'épinards, puis de saumon, et recouvrez de béchamel. Répétez jusqu'à épuisement des ingrédients, en terminant par une couche de béchamel.
  4) Parsemez de fromage râpé et enfournez pendant 30 à 40 minutes jusqu'à ce que les lasagnes soient dorées et cuites. Laissez reposer quelques minutes avant de servir.",
  meal: 'Plat',
  ingredient: " - 300g de feuilles de lasagnes
  - 400g de saumon frais
  - 300g d'épinards frais
  - 1 oignon
  - 2 gousses d'ail
  - 500ml de béchamel
  - 200g de fromage râpé (gruyère ou mozzarella)
  - 200ml de crème fraîche
  - 2 cuillères à soupe d'huile d'olive
  - Sel et poivre
  - Une pincée de muscade",
  user: users[0]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717934067/IMG_9103_axjksb.jpg")
recipe.photo.attach(io: file, filename: "lasagnes-saumon-epinards.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Tarte aux fraises de maman 💟',
  instruction: "Pour 4 personnes
  1) Mélangez la farine, le sucre et le sel dans un bol. Ajoutez le beurre froid coupé en petits morceaux et travaillez du bout des doigts jusqu'à obtenir une consistance sableuse. Incorporez l'œuf et l'eau froide pour former une boule de pâte. Enveloppez-la dans du film plastique et réfrigérez pendant 30 minutes.
  2) Préchauffez le four à 180°C. Étalez la pâte sur un plan de travail fariné et foncez un moule à tarte. Piquez le fond avec une fourchette, recouvrez de papier cuisson et de poids de cuisson (ou de haricots secs), puis faites cuire à blanc pendant 15 minutes. Retirez les poids et le papier, puis poursuivez la cuisson 10 minutes jusqu'à ce que la pâte soit dorée. Laissez refroidir.
  3) Étalez la crème pâtissière refroidie sur le fond de tarte cuit et refroidi.
  4) Lavez et équeutez les fraises, coupez-les en deux si elles sont grosses. Disposez les fraises harmonieusement sur la crème pâtissière. Si désiré, préparez le nappage selon les instructions du sachet et badigeonnez-en les fraises pour une finition brillante. Réfrigérez la tarte avant de servir.",
  meal: 'Dessert',
  ingredient: " Pour la pâte :
  250g de farine
  125g de beurre froid
  50g de sucre en poudre
  1 œuf
  Une pincée de sel
  2-3 cuillères à soupe d'eau froide

  Pour la garniture :
  500g de fraises fraîches
  200ml de crème pâtissière
  2 cuillères à soupe de sucre en poudre
  1 sachet de nappage pour tarte (facultatif)",
  user: users[0]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717934066/IMG_4829_eix6wp.jpg")
recipe.photo.attach(io: file, filename: "tarte-aux-fraises.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Pizza sans féculent 🥦',
  instruction: "Pour 4 personnes
  1) Préchauffez le four à 200°C. Coupez le brocoli en petits bouquets et mixez-les dans un robot culinaire jusqu'à obtenir une consistance de riz. Faites cuire le brocoli au micro-ondes pendant 5 minutes ou à la vapeur jusqu'à ce qu'il soit tendre. Laissez refroidir puis pressez-le dans un torchon propre pour enlever l'excès d'eau.
  2) Mélangez le brocoli égoutté, les œufs, le fromage râpé, l'origan, le sel et le poivre dans un bol. Étalez ce mélange sur une plaque de cuisson recouverte de papier sulfurisé en formant un disque de pâte. Enfournez pendant 20 minutes ou jusqu'à ce que la pâte soit dorée et ferme.
  3) Retirez la pâte du four et étalez la sauce tomate dessus. Parsemez de mozzarella râpée et ajoutez le pepperoni ou les légumes tranchés. Arrosez d'un filet d'huile d'olive.
  4) Remettez au four et faites cuire pendant 10 minutes supplémentaires ou jusqu'à ce que le fromage soit fondu et doré. Garnissez de feuilles de basilic frais avant de servir.",
  meal: 'Plat',
  ingredient: " Pour la pâte :
  1 gros brocoli (environ 500g)
  2 œufs
  100g de fromage râpé (mozzarella ou parmesan)
  1 cuillère à café d'origan séché
  Sel et poivre au goût

  Pour la garniture :
  200g de sauce tomate
  150g de mozzarella râpée
  100g de pepperoni ou de légumes tranchés (selon préférence)
  1 cuillère à soupe d'huile d'olive
  Feuilles de basilic frais pour la garniture (facultatif)",
  user: users[0]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717934043/IMG_2548_pexcnt.jpg")
recipe.photo.attach(io: file, filename: "pizza-sans-feculent.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Welsh du nord',
  instruction: "Pour 4 personnes
  1) Préchauffez le four à 200°C. Faites griller les tranches de pain jusqu'à ce qu'elles soient dorées. Disposez une tranche de jambon sur chaque tranche de pain grillé et placez-les dans un plat allant au four.
  2) Dans une casserole, faites fondre le beurre à feu moyen. Ajoutez la farine et mélangez pour obtenir un roux. Versez progressivement la bière en remuant constamment jusqu'à obtenir une sauce lisse et épaisse.
  3) Ajoutez le cheddar râpé, la moutarde, la sauce Worcestershire, le sel et le poivre. Continuez de remuer jusqu'à ce que le fromage soit complètement fondu et que la sauce soit homogène.
  4) Versez la sauce au fromage sur les tranches de pain et de jambon. Enfournez pendant 10 minutes ou jusqu'à ce que le fromage soit doré et bouillonnant. Si désiré, faites cuire les œufs au plat et déposez-en un sur chaque portion avant de servir.",
  meal: 'Plat',
  ingredient: " 4 tranches de pain de campagne
  200g de cheddar râpé
  4 tranches de jambon
  1 cuillère à soupe de moutarde de Dijon
  200ml de bière blonde
  50g de beurre
  2 cuillères à soupe de farine
  1 cuillère à soupe de sauce Worcestershire
  4 œufs (facultatif)
  Sel et poivre au goût",
  user: users[0]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717934059/IMG_4628_nbtkxm.jpg")
recipe.photo.attach(io: file, filename: "welsh.jpg", content_type: "photo/png")
recipe.save

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
  title: 'Tarte fine carottes/burrata',
  instruction: "1) Préchauffez le four à 200°C. Déroulez la pâte feuilletée sur une plaque de cuisson recouverte de papier sulfurisé. Piquez la pâte avec une fourchette.
  2) Épluchez les carottes et coupez-les en fines rondelles. Mélangez-les avec l'huile d'olive, le miel, le vinaigre balsamique, le thym, le sel et le poivre.
  3) Disposez les rondelles de carottes sur la pâte feuilletée en une seule couche uniforme. Enfournez pendant 20-25 minutes ou jusqu'à ce que la pâte soit dorée et croustillante.
  4) Sortez la tarte du four et laissez légèrement refroidir. Déchirez les burratas en morceaux et répartissez-les sur la tarte. Garnissez avec des feuilles de roquette avant de servir.",
  meal: 'Plat',
  ingredient: "1 pâte feuilletée
  4 carottes moyennes
  2 burratas
  2 cuillères à soupe d'huile d'olive
  1 cuillère à soupe de miel
  1 cuillère à soupe de vinaigre balsamique
  1 cuillère à café de thym frais
  Sel et poivre au goût
  Quelques feuilles de roquette (pour garnir)",
  user: users[0]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717934052/IMG_4231_u05bf6.jpg")
recipe.photo.attach(io: file, filename: "tarte-fine-carottes-burrata.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Tartines pêche/burrata ☀️',
  instruction: "1) Préchauffez le four à 200°C. Coupez les pêches en quartiers et mélangez-les avec une cuillère à soupe d'huile d'olive, le miel, le sel et le poivre. Étalez les pêches sur une plaque de cuisson et rôtissez-les pendant 15-20 minutes jusqu'à ce qu'elles soient tendres et caramélisées.
  2) Faites griller les tranches de pain de campagne jusqu'à ce qu'elles soient dorées et croustillantes.
  3) Frottez les tranches de pain grillé avec un peu d'huile d'olive. Disposez les quartiers de pêches rôties sur chaque tranche.
  4) Déchirez la burrata en morceaux et répartissez-les sur les pêches. Ajoutez la roquette par-dessus et arrosez légèrement de vinaigre balsamique avant de servir.",
  meal: 'Plat',
  ingredient: "4 tranches de pain de campagne
  2 pêches
  1 burrata
  1 tasse de roquette
  2 cuillères à soupe d'huile d'olive
  1 cuillère à soupe de vinaigre balsamique
  1 cuillère à café de miel
  Sel et poivre au goût",
  user: users[0]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717934031/B3182B6C-1F0B-4924-9181-A3280B18397A_urnraj.jpg")
recipe.photo.attach(io: file, filename: "tartine-peche-burrata.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Velouté butternut et oeuf mollet',
  instruction: "1) Préchauffez le four à 200°C. Épluchez, épépinez et coupez la courge butternut en cubes. Émincez l'oignon et l'ail.
  2) Disposez la courge, l'oignon et l'ail sur une plaque de cuisson, arrosez d'huile d'olive, salez et poivrez. Rôtissez au four pendant 25-30 minutes jusqu'à ce que les légumes soient tendres et légèrement caramélisés.
  3) Faites chauffer le bouillon de légumes dans une grande casserole. Ajoutez les légumes rôtis et laissez mijoter pendant 10 minutes. Mixez jusqu'à obtenir une consistance lisse, puis incorporez la crème fraîche.
  4) Faites cuire les œufs mollets en les plongeant dans de l'eau bouillante pendant 6 minutes, puis écalez-les. Servez le velouté dans des bols, ajoutez un œuf mollet au centre et parsemez de ciboulette ciselée avant de déguster.",
  meal: 'Entrée',
  ingredient: "1 courge butternut (environ 1 kg)
  1 oignon
  2 gousses d'ail
  1 litre de bouillon de légumes
  200 ml de crème fraîche
  4 œufs
  2 cuillères à soupe d'huile d'olive
  Sel et poivre au goût
  Quelques brins de ciboulette (pour garnir)",
  user: users[0]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717934043/IMG_2793_kvrylf.jpg")
recipe.photo.attach(io: file, filename: "oeuf-mollet-butternut.jpg", content_type: "photo/png")
recipe.save

recipe = Recipe.new(
  title: 'Pavlova aux fraises de Lucie 🍓',
  instruction: "1) Préchauffez le four à 120°C et chemisez une plaque de cuisson avec du papier sulfurisé. Tracez un cercle de 20 cm de diamètre sur le papier.
  2) Fouettez les blancs d'œufs en neige ferme, puis incorporez progressivement le sucre en poudre jusqu'à ce que la meringue soit lisse et brillante. Ajoutez la fécule de maïs, le vinaigre et l'extrait de vanille, puis mélangez délicatement.
  3) Étalez la meringue en formant un disque sur le cercle tracé. Creusez légèrement le centre pour former une cuvette. Enfournez pendant 1h30 à 2h jusqu'à ce que la meringue soit croustillante à l'extérieur et moelleuse à l'intérieur. Laissez refroidir dans le four éteint avec la porte entrouverte.
  4) Montez la crème liquide en chantilly avec le sucre glace. Garnissez la meringue refroidie de chantilly, puis ajoutez les fraises coupées en morceaux. Décorez avec des feuilles de menthe avant de servir.",
  meal: 'Dessert',
  ingredient: "4 blancs d'œufs
  250 g de sucre en poudre
  1 cuillère à soupe de fécule de maïs
  1 cuillère à café de vinaigre blanc
  1 cuillère à café d'extrait de vanille
  300 ml de crème liquide entière
  50 g de sucre glace
  500 g de fraises
  Quelques feuilles de menthe (pour garnir)",
  user: users[0]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/c_crop,ar_1:1/v1717934038/IMG_1118_kyw8xz.jpg")
recipe.photo.attach(io: file, filename: "pavlova-aux-fraises.jpg", content_type: "photo/png")
recipe.save


recipe = Recipe.new(
  title: 'La meilleure salade César 🤌🏼',
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
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717934007/00C3E30D-164B-45D6-980A-F1FCA477C032_spmjyu.jpg")
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
  title: 'Légumes rôtis d`Otto Lenghi 🤤',
  instruction: "1) Préchauffez le four à 200°C. Coupez les courgettes, l'aubergine et les poivrons en morceaux, l'oignon en quartiers et hachez l'ail.
  2) Mélangez les légumes avec l'huile d'olive, le vinaigre balsamique, le sel, le poivre et le thym. Étalez-les sur une plaque de cuisson. Faites rôtir pendant 30-40 minutes, en remuant à mi-cuisson.
  3) Ajoutez les tomates cerises et les pignons de pin sur la plaque 10 minutes avant la fin de la cuisson.
  4) Sortez les légumes du four et laissez-les légèrement refroidir. Ajoutez la feta émiettée et le basilic frais avant de servir.",
  meal: 'Plat',
  ingredient: "2 courgettes
  1 aubergine
  2 poivrons (rouge et jaune)
  1 oignon rouge
  2 gousses d'ail
  200 g de tomates cerises
  50 g de feta émiettée
  2 cuillères à soupe de pignons de pin
  3 cuillères à soupe d'huile d'olive
  1 cuillère à soupe de vinaigre balsamique
  Sel et poivre
  Quelques branches de thym frais
  1 poignée de basilic frais",
  user: users[2]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717934053/IMG_4421_vpzv2l.jpg")
recipe.photo.attach(io: file, filename: "legumes-rotis.jpg", content_type: "photo/png")
recipe.save


recipe = Recipe.new(
  title: 'Banoffee allégé ',
  instruction: "1) Mixez les biscuits digestifs en miettes et mélangez-les avec le beurre fondu. Tapissez le fond d'un moule à tarte avec ce mélange en pressant bien. Réfrigérez pendant 30 minutes.
  2) Faites cuire la boîte de lait concentré sucré fermée dans une grande casserole d'eau frémissante pendant environ 2 heures pour obtenir du caramel (dulce de leche). Assurez-vous que la boîte soit toujours immergée dans l'eau. Laissez refroidir avant d'ouvrir.
  3) Étalez le caramel refroidi sur la base de biscuits. Coupez les bananes en rondelles et disposez-les uniformément sur le caramel.
  4) Montez la crème liquide en chantilly avec le sucre glace et l'extrait de vanille. Étalez la chantilly sur les bananes. Garnissez de chocolat râpé avant de servir.",
  meal: 'Dessert',
  ingredient: "1 paquet de biscuits digestifs (environ 200 g)
  100 g de beurre fondu
  1 boîte de lait concentré sucré (400 g)
  3 bananes mûres
  300 ml de crème liquide entière
  50 g de sucre glace
  1 cuillère à café d'extrait de vanille
  Chocolat râpé (pour garnir)",
  user: users[2]
)
file = URI.open("https://res.cloudinary.com/dcg9gfbhm/image/upload/v1717936996/IMG_5245_igjuvu.jpg")
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
