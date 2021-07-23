class AddDeletedAtToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :deleted_at, :timestamp
    add_index :posts, :deleted_at
  end
end
