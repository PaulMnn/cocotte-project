# app/services/rmagick_service.rb
require 'rmagick'
include Magick

class RmagickService
  def self.create_image_with_text(ebook)

    ebook.recipages.each do |recipage|
     titre = recipage.recipe.title
     instructions = recipage.recipe.ingredient
     ingrédients = recipage.recipe.instruction

    template = '/home/luciedurak/code/luciedurak/COCOTTE/cocotte-project/app/assets/images/template.jpg'

    # Lisez les images
    img = Image.read(template).first

    draw = Draw.new
    draw.font = 'Helvetica'

    # titre
    draw.pointsize = 60
    draw.fill = 'black'
    draw.gravity = NorthGravity
    draw.annotate(img, 0, 0, 0, 50, titre)

     # instructions
    draw.pointsize = 30
    draw.gravity = NorthWestGravity
    draw.annotate(img, 0, 0, 30, 150, instructions)

    # ingrédients
    draw.pointsize = 30
    draw.gravity = WestGravity
    draw.annotate(img, 0, 0, 30, 300, ingrédients)

    # Enregistrez l'image résultante
    output_path = '/home/luciedurak/code/luciedurak/COCOTTE/cocotte-project/app/assets/images/output.jpg'
    img.write(output_path)

    output_path
    puts "Image generated at: #{output_path}"
  end
  end
end
