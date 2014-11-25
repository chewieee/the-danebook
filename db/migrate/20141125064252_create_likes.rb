class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
    	t.integer :user_id
    	t.integer :likable_id
    	t.string  :likable_type

      t.timestamps
    end

    add_index :likes, [:likable_type, :likable_id]
  end
end
