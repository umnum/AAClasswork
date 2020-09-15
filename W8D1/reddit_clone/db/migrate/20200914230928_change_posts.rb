class ChangePosts < ActiveRecord::Migration[5.2]
  def change
    remove_index :posts, :url
    change_column :posts, :url, :string
  end
end
