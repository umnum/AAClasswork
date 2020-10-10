# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bench.destroy_all

bench1 = Bench.create!(description: 'SF location1', lat: 37.754812, lng: -122.473304)
bench2 = Bench.create!(description: 'SF location2', lat: 37.763380, lng: -122.462619)
bench3 = Bench.create!(description: 'SF location3', lat: 37.733380, lng: -122.462619)
bench4 = Bench.create!(description: 'SF location4', lat: 37.743380, lng: -122.462619)
bench5 = Bench.create!(description: 'SF location5', lat: 37.773380, lng: -122.462619)