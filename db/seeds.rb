require 'json'
require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seed loading ..."

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktail_db = JSON.parse(open(url).read)

cocktail_db['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient.values.join)
end

puts "Finished"
