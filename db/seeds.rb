# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'faker'

# Cria 10 usuários de amostra
10.times do
  user = User.new(
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    city: Faker::Address.city,
    country: Faker::Address.country,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 115),
    gender: User::GENDERS.sample,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save(validate: false)
  puts "User #{user.first_name} created!"
end

# Cria 10 trips de amostra
10.times do
  trip = Trip.new(
    name: Faker::Address.city,
    start_date: Faker::Date.between(from: DateTime.now - 1, to: DateTime.now),
    end_date: Faker::Date.between(from: DateTime.now - 1, to: DateTime.now),
    destination: Faker::Address.city,
    budget_per_user: Faker::Number.decimal(l_digits: 2),
    owner_id: User.all.sample.id
  )
  trip.save(validate: false)
  puts "User #{trip.name} created!"
end

# Cria 10 tickets de amostra
10.times do
  ticket = Ticket.new(
    url: Faker::Internet.url,
    start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    origin: Faker::Address.city,
    destination: Faker::Address.city,
    seat: Faker::Alphanumeric.alpha(number: 10),
    gate: Faker::Alphanumeric.alpha(number: 10),
    price: Faker::Number.decimal(l_digits: 2),
    company_name: Faker::Company.name,
    user_id: User.all.sample.id,
    trip_id: Trip.all.sample.id
  )
  ticket.save(validate: false)
  puts "Ticket #{ticket.destination} created!"
end
