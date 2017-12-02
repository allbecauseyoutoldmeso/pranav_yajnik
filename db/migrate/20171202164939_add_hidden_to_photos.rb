class AddHiddenToPhotos < ActiveRecord::Migration[5.1]
  def up
    add_column :photos, :hidden, :boolean
  end

  def down
    remove_column :photos, :hidden
  end
end
