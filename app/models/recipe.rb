class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ebooks, through: :recipages
  validates :title, presence: true
  validates :meal, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_ingredient_meal_instruction,
  against: [ :title, :ingredient, :meal, :instruction ],
  using: {
    tsearch: { prefix: true }
  }
end
