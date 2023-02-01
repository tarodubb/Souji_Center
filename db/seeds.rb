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

addresses = ["Shibuya ku", "Chiyoda-ku", "Chuo-ku", "Minato-ku", "Shinjuku-ku", "Taito-ku", "Sumida-ku", "Koto-ku", "Shinagawa-ku", "Meguro-ku", "Ota-ku", "Setagaya-ku", "Nakano-ku", "Suginami-ku", "Toshima-ku", "Kita-ku", "Arakawa-ku", "Itabashi-ku", "Nerima-ku", "Adachi-ku"]

phone_numbers = ["03-5565-5737", "03-3261-3939", "03-6240-4774", "03-3445-0974", "03-3367-5878", "03-3841-3098", "03-3612-5547", "03-3641-4086", "03-3473-0356", "03-3713-9238", "03-3741-1995", "03-6873-4272", "03-3382-1214", "03-3398-8012", "03-3981-2375", "03-3906-0645", "03-3805-9811", "03-3972-5886", "03-3998-6706", "03-3927-0744"]

services_names = ["Vacation Rental Cleaning", "Residential Cleaning", "Express Cleaning", "Office Cleaning", "Window Cleaning", "Carpet Cleaning", "Floor Cleaning", "Janitorial Cleaning", "Move Out Cleaning", "Apartment Cleaning", "Laundry Services", "Sanitization Services", "Deep Cleaning", "Restroom Cleaning", "Curtain Cleaning", "Ceiling and Wall Cleaning", "Green Cleaning", "Regular Cleaning", "Post Construction Cleaning", "Commercial Cleaning"]

prices = ["3000", "3200", "3500", "3700", "3900", "4000", "4200", "4500", "4700", "4900", "5000", "5200", "5500", "5700", "5900", "6000", "6200", "6500", "6700", "6900"]

20.times do
  temp_user = User.create(
    first_name: first_names.sample,
    last_name: last_names.sample,
    password: Faker::Internet.password,
    address: addresses.sample,
    phone_number: phone_numbers.sample,
    email: Faker::Internet.email
  )

  temp_rand = rand(1..5)
  temp_rand.times do
    Service.create(
      name: services_names.sample,
      price: prices.sample,
      description: "This is where the user writes their description",
      user_id: temp_user.id
    )
  end
end

puts "Finished!"
