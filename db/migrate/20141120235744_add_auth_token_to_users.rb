class AddAuthTokenToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :remember_digest
  	add_column :users, :auth_token, :string
  end
end
