class Recipage < ApplicationRecord
  belongs_to :recipe
  belongs_to :ebook
  validates :templating, presence: true
end
