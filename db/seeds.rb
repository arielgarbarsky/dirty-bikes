require "open-uri"
files = []
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1589973614/tld9u20lhr70amlyiiix1yt08kgl.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1589977107/p9slk70ym308kf5cv1lq6i5dajwf.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1589983219/photo-1500578862199-d2872c0781ec_dvdkfa_a02wgn.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1589982800/photo-1418793124283-7935cb656d02_kiu2ou.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1589982776/photo-1542550546-88afdd84b64f_vmglrl.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1590000851/photo-1518886735984-4d11d9747897_uqunph_jg4ld9.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1589982753/photo-1489730896401-ae2beb188bef_qkho7d.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1590001097/photo-1515540468442-bcec79e94728_dmnt4s.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1590001198/photo-1529384342872-c0d18db57a6c_d9ahqr.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1590001261/photo-1503351392692-acfef9427797_wy47zk.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1590001413/photo-1509493435975-51bcb821d252_fadhmz.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1590001462/photo-1549530195-08c51a454504_bhflzb.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1590001494/photo-1496705048923-c5a338800024_rytz10.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1590001580/photo-1536346218367-c0b12f24ef7e_krz0ir.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1590001662/photo-1556176226-75d39eda8fee_j5vfq3.jpg")
files << URI.open("https://res.cloudinary.com/szkloud/image/upload/v1590001730/photo-1562802963-4a08e54fddf4_m6lism.jpg")

descriptions = []

descriptions << "This bike will surely give you a thrill. Recently tuned up and taken care of throughout. Try her out!"
descriptions << 'Love this bike, best purchase I ever made, and would love to share it with you. (for a small price of course 😉)'
descriptions << 'Smooth ride and great shocks. Throttle responds really well.'
descriptions << 'Less than a year old and rides like a charm. Looks great too 😎)'
descriptions << 'Great bike for a solo trip in the desert. The bike is powerful (200cc) and quite light'
descriptions << 'A lightweight motorcycle designed for use on rough surfaces, such as dirt roads or trails.'
descriptions << 'special tires and suspension for riding on unpaved and dry roads - perfect for the desert'
descriptions << 'The newest carbon frame you can find in Israel'
descriptions << 'High performance bike for tracks with steep jumps and obstacles'
descriptions << 'An absolute original. Think of it as a two wheeled jeep.'
descriptions << 'A great bike with an emphasizing on speed, acceleration and braking. This bike a little bit less comfortable that regular ones because of its lightweight frame.'
descriptions << 'A bike designed for long distance. This bike is very comfortable and can easily carry 2 passengers.'
descriptions << 'Distinct rearward-slanted cylinder design is now even lighter and more compact than before, ideally positioned in the frame for optimized weight distribution.'
descriptions << 'Aggressive cam profiles, cylinder geometry and much more work together to give riders a broad spread of useable thrust with excellent high-rpm power.'
descriptions << "Purpose-built dirt bike that is intended for use solely as a recreational tool and to hone dirt riding skills. 'accessible and suitable for its nature'."
descriptions << 'Dominates the off-road circuit. Loaded with features and performance that makes it one of the best motorcycles in the segment. Engine is extremely capable and can help the rider conquer some titles.'

puts 'Cleaning database...'
Booking.destroy_all
Bike.destroy_all
User.destroy_all

## Creating users
puts 'Creating Users...'

users = []

users << User.create!(first_name: 'bob', last_name: 'smith', username: 'bob1', email: 'bob@bob.com', password: '123456')
users << User.create!(first_name: 'Schneur', last_name: 'Kam', username: 'szk1', email: 'szk@szk.com', password: '123456')

 16.times do
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

 16.times do |i|
  brand = %w[Honda Fantic KTM Yamaha Suzuki Cyberquad].sample
  location = Faker::Address.city
  price = rand(50..150)
  user = users[i]
  description = descriptions[i]
  bike = Bike.new(brand: brand, location: location, price: price, user: user, description: description)
  bike.photos.attach(io: files[i], filename: "bik#{i}.png", content_type: 'image/png')
  bike.save
  bikes << bike
end

bikes.each do |bike|
  puts "Created #{bike.brand}"
end

## Creating Bookings
puts 'Creating Bookings...'

bookings = []

 16.times do |i|
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
