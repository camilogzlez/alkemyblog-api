class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :image
      t.datetime :creation_date
      t.references :user, null: false, foreign_key: true
      t.references :categorie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
