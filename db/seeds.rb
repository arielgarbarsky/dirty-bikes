puts 'Cleaning database...'
Booking.destroy_all
Bike.destroy_all
User.destroy_all

## Creating users
puts 'Creating Users...'

users = []

users << User.create!(first_name: 'bob', last_name: 'smith', username: 'bob1', email: 'bob@bob.com', password: '123456')

 5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = Faker::Internet.username(4)
  email = Faker::Internet.email
  password = Faker::Internet.password(8)
  users << User.create!(first_name: first_name, last_name: last_name, username: username, email: email, password: password)
end

users.each do |user|
  puts "Created #{user.username}"
end

## Creating Bikes
puts 'Creating Bikes...'

bikes = []

 5.times do |i|
  brand = %w(honda fantic ktm yamaha suzuki cyberquad).sample
  location = Faker::Address.city
  price = rand(50..150)
  user = users[i]
  bikes << Bike.create!(brand: brand, location: location, price: price, user: user)
end

bikes.each do |bike|
  puts "Created #{bike.brand}"
end

## Creating Bookings
puts 'Creating Bookings...'

bookings = []

 5.times do |i|
  rent_date = Faker::Date.forward(60)
  user = users[i]
  bike = bikes[i+1]
  bike = bikes[0] if bike.nil?
  bookings << Booking.create!(rent_date: rent_date, user: user, bike: bike)
end

bookings.each do |booking|
  puts "Created #{booking.rent_date}"
end

puts 'Seeding complete!'
