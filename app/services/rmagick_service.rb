# app/services/rmagick_service.rb
require 'rmagick'
require "open-uri"
include Magick

class RmagickService
  def initialize(recipage)
    @recipage = recipage
  end

  def create_image_with_text

    titre = @recipage.recipe.title
    instructions = @recipage.recipe.instruction
    ingredients = @recipage.recipe.ingredient

    template = @recipage.ebook.theme == "background-ilu.jpg" ? "template-ilu.jpg" : "template-ro.jpg"

    # template = '/home/luciedurak/code/luciedurak/COCOTTE/cocotte-project/app/assets/images/template.jpg'

    # Lisez les images
    img = Image.read("/home/luciedurak/code/luciedurak/COCOTTE/cocotte-project/app/assets/images/#{template}").first

    draw = Draw.new
    draw.font = 'Helvetica'

    # titre
    draw.pointsize = 90
    draw.fill = 'black'
    draw.gravity = NorthGravity
    draw.annotate(img, 1298, 231, 56, 56, titre)

     # instructions
    draw.pointsize = 30
    draw.gravity = NorthWestGravity
    draw.annotate(img, 828, 913, 56, 1279, instructions)

    # ingrédients
    draw.pointsize = 30
    draw.gravity = WestGravity
    draw.annotate(img, 1298, 493, 56, 537, ingredients)

    # Enregistrez l'image résultante
    output_path = '/home/luciedurak/code/luciedurak/COCOTTE/cocotte-project/app/assets/images/output.jpg'
    img.write(output_path)

    # file = "output.jpg"
    cloud = Cloudinary::Uploader.upload(output_path)
    file = URI.open(cloud["url"])
    @recipage.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

    # Enregistrez l'image dans un flux en mémoire
    # img_blob = img.to_blob { self.format = 'JPEG' }
    # img_io = StringIO.new(img_blob)

    # Upload l'image sur Cloudinary
    # cloudinary_response = Cloudinary::Uploader.upload(img_io, resource_type: :image)

    # Renvoyer l'URL de l'image hébergée sur Cloudinary
    # cloudinary_response['url']

    # output_path
    # puts "Image generated at: #{output_path}"

    # @recipage.templating = envoyer à cloudinary
  end
end
