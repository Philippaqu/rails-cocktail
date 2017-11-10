# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'



Ingredient.destroy_all


url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

get_content = open(url).read

drinks_all = JSON.parse(get_content)
drinks_seperate = drinks_all["drinks"]
drinks_seperate.each do |ingredient|
  i = ingredient["strIngredient1"]
  Ingredient.create!(name: i)
end

