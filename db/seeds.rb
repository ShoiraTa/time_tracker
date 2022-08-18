User.create(email: "user@gmail.com", 
            password: '123456',
            password_confirmation: '123456', 
            first_name: 'User',
            last_name:'last',
            phone_number: '995551113368')
User.create(email: "admin@gmail.com", 
            password: '123456',
            password_confirmation: '123456', 
            first_name: 'User',
            last_name:'last',
            phone_number: '995551113368',
            type: 'AdminUser')
  
10.times do  |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user: User.first, overtime_hours: 1)
end
puts 'Post created'

10.times do  |auditlog|
  Auditlog.create(user: User.first, start_date: Date.today - 6.days,end_date: nil) 
end

puts 'Auditlog created'