# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
puts "Cleaning database..."
Booking.destroy_all
Service.destroy_all
User.destroy_all

puts "Creating users..."

cleaning_services = ["Basic House Cleaning", "Deep Cleaning", "Laundry Services", "Sanitization Services", "Ceiling and Wall Cleaning", "Curtain Cleaning", "Carpet Cleaning", "Window Cleaning", "Restroom Cleaning", "Janitorial Services"]

10.times do
  temp_user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Internet.password,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email
  )

  5.times do
    temp_rand = rand(0..9)
    Service.create(
      name: cleaning_services[temp_rand],
      price: Faker::Commerce.price,
      description: "This is where the user writes their description",
      user_id: temp_user.id
    )
  end
end

puts "Finished!"
