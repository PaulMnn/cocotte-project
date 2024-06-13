class Ebook < ApplicationRecord
  belongs_to :user
  has_many :recipages, dependent: :destroy
  has_many :recipes, through: :recipages
  validates :theme, presence: true
  validates :ebook_title, presence: true
  has_one_attached :photo
  accepts_nested_attributes_for :recipages

  before_create :associate_theme

  def dishes_count
    recipes.where(meal: 'Plat').count
  end

  def starters_count
    recipes.where(meal: 'Entrée').count
  end

  def desserts_count
    recipes.where(meal: 'Dessert').count
  end

  def associate_theme
    self.theme = (self.theme == "theme-1") ? "background-ilu.jpg" : "background-bleu-fonce.jpg"
  end
end
