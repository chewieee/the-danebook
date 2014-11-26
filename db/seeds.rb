# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users

User.create!(first_name: "Matt",
	           last_name: "Davis",
	           email: "mdavis@example.com",
	           password: "password",
	           password_confirmation: "password",
	           birth_day: 1,
	           birth_month: 1,
	           birth_year: 1980,
	           gender: "male")

99.times do |n|
	first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n+1}@danebook.com"
  password = "password"
  birth_day = rand(1..30)
  birth_month = rand(1..12)
  birth_year = rand(1900...2000)
  gender = %w{male female}.sample
    User.create!(first_name: first_name,
    	           last_name: last_name,
    	           email: email,
    	           password: password,
    	           password_confirmation: password,
    	           birth_day: birth_day,
    	           birth_month: birth_month,
    	           birth_year: birth_year,
    	           gender: gender)
  end
  