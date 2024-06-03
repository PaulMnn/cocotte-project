class CreateRecipages < ActiveRecord::Migration[7.1]
  def change
    create_table :recipages do |t|
      t.string :templating
      t.references :recipe, null: false, foreign_key: true
      t.references :ebook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
