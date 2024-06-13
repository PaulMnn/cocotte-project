class Recipage < ApplicationRecord
  require_dependency 'rmagick_service'

  belongs_to :recipe
  belongs_to :ebook
  has_one_attached :page
  has_one_attached :photo

  before_create :set_template

  def set_template
    RmagickService.new(self).create_image_with_text
  end
end
