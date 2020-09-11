class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null:false
      t.string :detail, null:false

      t.boolean :finished, null:false
      t.boolean :visibility, null:false, default: 'true' #true == public, false == private
      t.boolean :completed, null:false

      t.integer :cheers, null:false
      t.integer :user_id, null:false

      t.timestamps
    end
    add_index :goals, :user_id
  end
end
