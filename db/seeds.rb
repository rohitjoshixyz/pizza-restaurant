# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_data = CSV.read("#{Rails.root}/tieb_seed_data.csv")
csv_data.drop(1).each do |row|
  MenuItem.create(category: row[0], name: row[1], description: row[2], price: row[3], size: "regular")
end