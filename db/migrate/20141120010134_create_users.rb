class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :email, null: false
    	t.string :password_digest
    	t.string :auth_token
    	t.integer :birth_day, null: false 
    	t.integer :birth_month, null: false
    	t.integer :birth_year, null: false
    	t.string :gender, null: false
    	t.string :college
    	t.string :hometown
    	t.string :currently_lives
    	t.string :phone
    	t.string :words
    	t.string :about_me

      t.timestamps
    end
  end
end
