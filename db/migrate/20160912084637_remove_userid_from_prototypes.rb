class RemoveUseridFromPrototypes < ActiveRecord::Migration
  def change
    remove_column :prototypes, :user_id, :string
  end
end
