class CreateEbooks < ActiveRecord::Migration[7.1]
  def change
    create_table :ebooks do |t|
      t.string :ebook_title
      t.string :theme
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
