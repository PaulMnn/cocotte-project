require_relative 'config/environment'
require_relative 'app/services/rmagick.rb'

ebook = Ebook.first # Utilise le premier ebook de la base de données pour le test

RMagickService.create_image_with_text(ebook)
