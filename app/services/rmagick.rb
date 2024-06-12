# # app/services/rmagick_service.rb
# require 'rmagick'
# include Magick

# class RMagickService
#   def self.create_image_with_text(title, ingredients, instructions)

#     Page0ebook1 = '/home/luciedurak/code/luciedurak/COCOTTE/cocotte-project/app/assets/images/Page0-ebook1.jpg'

#     # Lisez les images
#     img1 = Image.read(Page0ebook1).first

#     # Définir les paramètres de texte
#     text = "#{title}"
#     draw = Draw.new
#     draw.font = 'Helvetica'
#     draw.pointsize = 60
#     draw.fill = 'black'
#     draw.gravity = CenterGravity

#     draw.annotate(img1, 0, 0, 30, 30, text)

#     # Enregistrez l'image résultante
#     output_path = '/home/luciedurak/code/luciedurak/COCOTTE/cocotte-project/app/assets/images/output.jpg'
#     img1.write(output_path)

#     output_path
#     puts "Image generated at: #{output_path}"
#   end
# end
