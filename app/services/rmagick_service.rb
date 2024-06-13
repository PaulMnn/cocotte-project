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

    # Lisez les images
    img = Image.read("app/assets/images/#{template}").first

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
    wrapped_instructions = wrap_text(draw, instructions, 30, 1350)
    draw_text_lines(draw, img, wrapped_instructions, 56, 1279, 30)

    # ingrédients
    draw.pointsize = 30
    draw.gravity = WestGravity
    draw.annotate(img, 1298, 493, 56, 537, ingredients)

    # Enregistrez l'image résultante
    output_path = 'app/assets/images/output.jpg'
    img.write(output_path)

    # Upload l'image sur Cloudinary
    cloud = Cloudinary::Uploader.upload(output_path)
    file = URI.open(cloud["url"])
    @recipage.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  end

  private

  def wrap_text(draw, text, pointsize, max_width)
    wrapped_text = []
    words = text.split(' ')
    current_line = ''

    words.each do |word|
      test_line = current_line.empty? ? word : "#{current_line} #{word}"
      metrics = draw.get_type_metrics(test_line) { |options| options.pointsize = pointsize }

      if metrics.width <= max_width
        current_line = test_line
      else
        wrapped_text << current_line
        current_line = word
      end
    end

    wrapped_text << current_line unless current_line.empty?
    wrapped_text
  end

  def draw_text_lines(draw, image, text_lines, x, y, pointsize)
    line_height = draw.get_type_metrics("Hy") { |options| options.pointsize = pointsize }.height
    text_lines.each_with_index do |line, index|
      draw.annotate(image, 0, 0, x, y + index * line_height, line)
    end
  end
end
