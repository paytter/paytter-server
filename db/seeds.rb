# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

def make_dummy_data(data)
  data[1..-1].map { |d| Hash[*data[0].zip(d).flatten] }
end

# products
Product.create(make_dummy_data(CSV.read('db/seed_data/products.csv')))
p 'products created.'

# foods
Food.create(make_dummy_data(CSV.read('db/seed_data/foods.csv')))
p 'foods created.'

