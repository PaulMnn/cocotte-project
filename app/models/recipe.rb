class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ebooks, through: :recipages
  has_one_attached :photo

  validates :title, presence: true
  validates :meal, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_ingredient_and_instruction,
  against: [ :title, :ingredient, :meal, :instruction ],
  using: {
    tsearch: { prefix: true }
  }


  def set_content
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{
        role: "user",
        content: "renvoie moi au format JSON contenant ces clés: \"titre\", \"ingrédients\", \"étapes de préparation\" de la recette issu de ce lien: #{self.link_url}."
        }]
    })

    new_content = JSON.parse(chaptgpt_response["choices"][0]["message"]["content"])

     self.title = new_content["titre"]
     self.ingredient = new_content["ingrédients"].join("\n")
     self.instruction = new_content["étapes de préparation"].join("\n")
  end
end
