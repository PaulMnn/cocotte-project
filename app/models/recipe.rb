class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ebooks, through: :recipages
  has_one_attached :photo

  validates :title, presence: true
  validates :meal, presence: true
end
