class AddRememberDigestToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :auth_token
    add_column :users, :remember_digest, :string
  end
end
