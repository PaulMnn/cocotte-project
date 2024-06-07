class Ebook < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :recipages
  validates :theme, presence: true
  validates :ebook_title, presence: true
  has_one_attached :photo

  def dishes_count
    recipes.where(meal: 'Plat').count
  end

  def starters_count
    recipes.where(meal: 'Entrée').count
  end

  def desserts_count
    recipes.where(meal: 'Dessert').count
  end

  accepts_nested_attributes_for :recipages
end
