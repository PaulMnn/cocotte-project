class RenameTemplatingToPhotoInRecipages < ActiveRecord::Migration[7.1]
  def change
    rename_column :recipages, :templating, :photo
  end
end
