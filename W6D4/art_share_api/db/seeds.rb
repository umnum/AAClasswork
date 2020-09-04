# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Artwork.destroy_all

user1 = User.create!(username: 'Dennis')
user2 = User.create!(username: 'Scottie')
user3 = User.create!(username: 'Michael')


artwork1 = Artwork.create!(image_url: "img_url_1", title: "Dennis' Masterpiece", artist_id: user1.id)
artwork2 = Artwork.create!(image_url: "img_url_2", title: "Scottie 2 Hottie", artist_id: user2.id)
artwork3 = Artwork.create!(image_url: "img_url_3", title: "The GOAT", artist_id: user2.id)
artwork4 = Artwork.create!(image_url: "img_url_4", title: "The GOAT", artist_id: user3.id)