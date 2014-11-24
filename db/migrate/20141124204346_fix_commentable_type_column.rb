class FixCommentableTypeColumn < ActiveRecord::Migration
  def change
  	remove_column :comments, :commentable_type
  	add_column :comments, :commentable_type, :string
  end
end
