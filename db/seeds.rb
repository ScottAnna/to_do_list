# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
  Task.create(name: "Task#{n + 1}", due: Date.tomorrow, order_number: n + 1, list_id: [1,2].sample)
end

User.create(email: "email@email.com", password: "password")

List.create(name: "Personal", user_id: 1)
List.create(name: "Work", user_id: 1)
