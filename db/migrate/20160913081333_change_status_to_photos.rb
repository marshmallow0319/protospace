class ChangeStatusToPhotos < ActiveRecord::Migration
  def up
    change_column :photos, :status, :integer, default: 0, null: false
  end

  def down
    change_column :photos, :status, :integer, default: 0, null: false, limit: 1
  end
end
