# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# require 'faker'

# # Create 
# Faker::Config.random = Random.new(42)

# # Create 676 products.
# 676.times do
# Product.create(
# title: Faker::Commerce.product_name,
# description: Faker::Lorem.sentence,
# price: Faker::Commerce.price,
# stock_quantity: Faker::Number.between(from: 1, to: 100)
# )
# end

require "csv"

Product.destroy_all
Category.destroy_all

# Find the csv file and parse it.
csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

# headers true means it has header.
products = CSV.parse(csv_data, headers: true)

products.each do |product|
  # Fetch product's data.
  title = product['name']
  description = product['description']
  price = product['price']
  stock_quantity = product['stock quantity']
  category_name = product['category']
  
  # Create or find the category by name.
   category = Category.find_or_create_by(name: category_name)

  #  A convinient way to create new product with category: The category.products method returns a collection of products associated with that category. 
  product = category.products.create(
    title: title,
    description: description,
    price: price,
    stock_quantity: stock_quantity
  )
end