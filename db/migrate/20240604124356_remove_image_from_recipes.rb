class RemoveImageFromRecipes < ActiveRecord::Migration[7.1]
  def change
    remove_column :recipes, :image, :string
  end
end
