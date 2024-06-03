class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ebooks, through: :recipages
  validates :title, presence: true
  validates :meal, presence: true
end
