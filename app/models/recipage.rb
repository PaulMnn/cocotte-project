class Recipage < ApplicationRecord
  belongs_to :recipe
  belongs_to :ebook
  has_one_attached :page
end
