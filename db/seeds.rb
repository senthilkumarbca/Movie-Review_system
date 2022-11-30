# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

movie = Movie.create(name:"Love Today", release_date:"Fri, 04 Nov 2022", average_rating: '0', reviews_count: '0')
movie1 = Movie.create(name:"Ponniyin Selvan", release_date:"Thu, 29 Sep 2022", average_rating: '0', reviews_count: '0')
movie2 = Movie.create(name:"Sardar", release_date:"Fri, 21 Oct 2022", average_rating: '0', reviews_count: '0')


movie.image.attach(io: File.open("#{Rails.root}/app/assets/images/seed/lovetoday.png"), filename: "lovetoday.png", content_type: "image/png")
movie1.image.attach(io: File.open("#{Rails.root}/app/assets/images/seed/ps1.png"), filename: "ps1.png", content_type: "image/png")
movie2.image.attach(io: File.open("#{Rails.root}/app/assets/images/seed/sardar.png"), filename: "sardar.png", content_type: "image/png")

