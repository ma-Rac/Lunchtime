# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
lT1 = Lunchtable.create(price: 2, total: 0)
user1 = User.create(balance: 0, name: "Jeggers", email: "t@t.com", password: "test1234")
lunch = Lunch.create(user: user1, lunchtable: lT1, paid: 0)
lT2 = Lunchtable.create(price: 3, total: 0)
