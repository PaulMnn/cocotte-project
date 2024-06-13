# app/services/rmagick_service.rb
require 'rmagick'
include Magick

class RMagickService
  def initialize(recipage)
    @recipage = recipage
  end

  def create_image_with_text

    titre = @recipage.recipe.title
    instructions = @recipage.recipe.instruction
    ingredients = @recipage.recipe.ingredient
    template = @recipage.ebook.theme
    raise

    # template = '/home/luciedurak/code/luciedurak/COCOTTE/cocotte-project/app/assets/images/template.jpg'

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
    draw.annotate(img, 0, 0, 30, 300, ingredients)

    # Enregistrez l'image résultante
    # output_path = '/home/luciedurak/code/luciedurak/COCOTTE/cocotte-project/app/assets/images/output.jpg'
    # img.write(output_path)

    # Enregistrez l'image dans un flux en mémoire
    img_blob = img.to_blob { self.format = 'JPEG' }
    img_io = StringIO.new(img_blob)

    # Upload l'image sur Cloudinary
    cloudinary_response = Cloudinary::Uploader.upload(img_io, resource_type: :image)

    # Renvoyer l'URL de l'image hébergée sur Cloudinary
    cloudinary_response['url']

    output_path
    puts "Image generated at: #{output_path}"

    # recipage.templating = lien cloudinary
  end
end
