class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :prototype
      t.string :content
      t.integer :status, default: 0, null: false, limit: 1
      t.timestamps null: false
    end
  end
end
