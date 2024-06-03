class Ebook < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :recipages
  validates :theme, presence: true
  validates :ebook_title, presence: true
end
