class RemoveImageFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :image, :varchar
  end
end
