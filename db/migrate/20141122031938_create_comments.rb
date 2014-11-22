class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :content
      t.integer :commentable_id
      t.integer :commentable_type

      t.timestamps
    end

    add_index :comments, [:commentable_type, :commentable_id]
  end
end
