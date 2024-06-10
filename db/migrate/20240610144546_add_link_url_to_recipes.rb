class AddLinkUrlToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :link_url, :string
  end
end
