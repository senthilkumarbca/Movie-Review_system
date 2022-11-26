# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: "senthilthoondi@gmail.com", password: "kum32ps4") if User.count.zero?

Movie.create!(name:"Love Today", release_date:"2022-11-04") if Movie.count.zero?