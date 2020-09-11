class RenameDetailToDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :goals, :detail, :details
  end
end
