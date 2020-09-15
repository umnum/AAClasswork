class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :content, null: false
      t.integer :sub_id, null: false
      t.integer :author_id, null: false
      t.timestamps
    end
    add_index :posts, :title
    add_index :posts, :url, unique: true
    add_index :posts, :author_id
  end
end
