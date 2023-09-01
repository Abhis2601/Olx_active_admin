# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

#   Character.create(name: "Luke", movie: movies.first)

  categories = Category.create([{ category_name: 'Electronics and Appliances' },{ category_name: 'Mobiles' },{ category_name: 'Bikes' },{ category_name: 'Cars' },{ category_name: 'Property' },{ category_name: 'Furniture' } ])