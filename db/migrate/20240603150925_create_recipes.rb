class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :instruction
      t.string :meal
      t.string :image
      t.text :ingredient
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
