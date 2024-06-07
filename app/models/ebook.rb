class Ebook < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :recipages
  has_many :recipages
  validates :theme, presence: true
  validates :ebook_title, presence: true
  has_one_attached :photo
  accepts_nested_attributes_for :recipages
end
