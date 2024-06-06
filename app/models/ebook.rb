class Ebook < ApplicationRecord
  belongs_to :user
  has_many :recipages
  has_many :recipes, through: :recipages
  validates :theme, presence: true
  validates :ebook_title, presence: true
  has_one_attached :photo
end
