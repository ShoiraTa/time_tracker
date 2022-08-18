# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(email: "user@gmail.com", 
                  password: '123456',
                  password_confirmation: '123456', 
                  first_name: 'User',
                  last_name:'last',
                  phone_number: '995551113368')
  
10.times do  |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user: User.first, overtime_hours: 1)
end