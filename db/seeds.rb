# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '=============Create users seeds==================='
User.create(name: 'Admin',
            last_name: 'Admin',
            username: 'admin',
            email: 'admin@factoro_test.com',
            password: 'admin',
            password_confirmation: 'admin')

20.times do |i|
  User.create(name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: '123456',
              password_confirmation: '123456',
              username: "user#{i}"
  )
end

puts '=============Created users seeds=================='

puts '=============Create beers seeds==================='

(1..).each do |i|
  response = Faraday.get("https://api.punkapi.com/v2/beers?per_page=50&page=#{i}")
  beers_params = JSON.parse(response.body)
  Beer.import beers_params.map{ |beer_params| beer_params.slice('name', 'tagline', 'description', 'abv') }

  break if beers_params.blank?
end

puts '=============Created beers seeds==================='
