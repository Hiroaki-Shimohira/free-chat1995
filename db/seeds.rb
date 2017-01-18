# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

user_csv = CSV.readlines("db/users_view.csv")
user_csv.shift
user_csv.each do |row|
  User.create(name: row[1], email: row[2], encrypted_password: row[3])
end