class RenameCats < ActiveRecord::Migration[5.2]
  def change
    rename_table :Cats, :cats
  end
end
