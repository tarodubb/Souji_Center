
require 'open-uri'

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

first_names = ["Rin", "Kaede", "Tsumugi", "Aoi", "Rei", "An", "Hina", "Mei", "Yuna", "Riko", "Yuzuki", "Haruna", "Shiori", "Yui", "Sakura", "Mizuki", "Akari", "Honoka", "Nanami", "Ichika"]

last_names = ["Sato", "Suzuki", "Takahashi", "Tanaka", "Watanabe", "Ito", "Yamamoto", "Nakamura", "Kobayashi", "Kato", "Yoshida", "Yamada", "Sasaki", "Yamaguchi", "Saito", "Matsumoto", "Inoue", "Kimura", "Hayashi", "Shimizu"]

addresses = ["2-15-1 Dogenzaka, Shibuya ku, 150-0043", "2-21-4 Kanda Jimbocho, Chiyoda-ku, 101-0051", "1-28-11 Ginza, Chuo-ku, 104-0061", "2-7-8 Takanawa, Minato-ku, 108-0074", "4-8-21 Kita-Shinjuku, Shinjuku-ku, 169-0074", "4-1-7 Taito, Taito-ku, 110-0016", "1-2-11 Tachibana, Sumida-ku, 131-0043", "4-19-17 Kitasuna, Koto-ku, 136-0073", "2-4-22 Hatanodai, Shinagawa-ku, 142-0064", "2-8-1 Mita, Meguro-ku, 153-0062", " 2-1-6 Kamata, Ota-ku, 144-0052", "2-4-5 Shimouma, Setagaya-ku, 154-0002", "3-33-3 Nakano, Nakano-ku, 164-0001", "4-20-15 Ogikubo, Suginami-ku, 167-0051", "2-64-13 Ikebukuro, Toshima-ku, 171-0014", "2-16-15 Oji, Kita-ku, 114-0002", "6-21 Arakawa, Arakawa-ku, 116-0002", "21-10 Saiwaicho, Itabashi-ku, 173-0034", "2-40-4 Fujimidai, Nerima-ku, 177-0034", "1-17-23 Nishiiko, Adachi-ku, 121-0824"]

phone_numbers = ["03-5565-5737", "03-3261-3939", "03-6240-4774", "03-3445-0974", "03-3367-5878", "03-3841-3098", "03-3612-5547", "03-3641-4086", "03-3473-0356", "03-3713-9238", "03-3741-1995", "03-6873-4272", "03-3382-1214", "03-3398-8012", "03-3981-2375", "03-3906-0645", "03-3805-9811", "03-3972-5886", "03-3998-6706", "03-3927-0744"]

services_names = ["Vacation Rental Cleaning", "Residential Cleaning", "Express Cleaning", "Office Cleaning", "Window Cleaning", "Carpet Cleaning", "Floor Cleaning", "Janitorial Cleaning", "Move Out Cleaning", "Apartment Cleaning", "Laundry Services", "Sanitization Services", "Deep Cleaning", "Restroom Cleaning", "Curtain Cleaning", "Ceiling and Wall Cleaning", "Green Cleaning", "Regular Cleaning", "Post Construction Cleaning", "Commercial Cleaning"]

prices = ["3000", "3200", "3500", "3700", "3900", "4000", "4200", "4500", "4700", "4900", "5000", "5200", "5500", "5700", "5900", "6000", "6200", "6500", "6700", "6900"]

20.times do |i|
  p i
  img = URI.open("https://res.cloudinary.com/dfzu3kr1a/image/upload/v1675478845/souji_center/profile_images/#{i+1}.jpg")
  temp_user = User.new(
    first_name: first_names.sample,
    last_name: last_names.sample,
    password: Faker::Internet.password,
    address: addresses.sample,
    phone_number: phone_numbers.sample,
    email: Faker::Internet.email
  )
  temp_user.photo.attach(io: img, filename: "avatar.png")
  temp_user.save

  temp_rand = rand(1..5)
  temp_rand.times do
    Service.create(
      name: services_names.sample,
      price: prices.sample,
      address: ["2-15-1 Dogenzaka, Shibuya ku, 150-0043", "2-21-4 Kanda Jimbocho, Chiyoda-ku, 101-0051", "1-28-11 Ginza, Chuo-ku, 104-0061", "2-7-8 Takanawa, Minato-ku, 108-0074", "4-8-21 Kita-Shinjuku, Shinjuku-ku, 169-0074", "4-1-7 Taito, Taito-ku, 110-0016", "1-2-11 Tachibana, Sumida-ku, 131-0043", "4-19-17 Kitasuna, Koto-ku, 136-0073", "2-4-22 Hatanodai, Shinagawa-ku, 142-0064", "2-8-1 Mita, Meguro-ku, 153-0062", " 2-1-6 Kamata, Ota-ku, 144-0052", "2-4-5 Shimouma, Setagaya-ku, 154-0002", "3-33-3 Nakano, Nakano-ku, 164-0001", "4-20-15 Ogikubo, Suginami-ku, 167-0051", "2-64-13 Ikebukuro, Toshima-ku, 171-0014", "2-16-15 Oji, Kita-ku, 114-0002", "6-21 Arakawa, Arakawa-ku, 116-0002", "21-10 Saiwaicho, Itabashi-ku, 173-0034", "2-40-4 Fujimidai, Nerima-ku, 177-0034", "1-17-23 Nishiiko, Adachi-ku, 121-0824"].sample,
      description: "This is where the user writes their description",
      user_id: temp_user.id
    )
  end
end

puts "Finished!"
