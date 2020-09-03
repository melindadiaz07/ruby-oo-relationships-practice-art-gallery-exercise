require_relative '../config/environment.rb'


vangogh = Artist.new("Van Gogh", 32)
banksy = Artist.new("Banksy", 13)
picasso = Artist.new("Picasso", 73)

moma = Gallery.new("MOMA","NYC")
freel = Gallery.new("Freel Gallery", "DC")

starry_night = Painting.new("Starry Night", 10000000, freel, vangogh)
sunflowers = Painting.new("Sunflowers", 276000, freel, vangogh)
mildwest = Painting.new("The Mild Mild West", 0, moma, banksy)
kissing_coppers = Painting.new("Kissing Coppers", 3857, freel, banksy)
guernica = Painting.new("Guernica", 397000, freel, picasso)


puts "Artist class can return all the artists"
p Artist.all.length == 3

puts "A gallery knows it's name"
p moma.name == "MOMA"

puts "A Painting knows its gallery and artist"
p starry_night.gallery == freel
p sunflowers.artist == vangogh

puts "A painting knows its title and price"
p guernica.title == "Guernica"
p mildwest.price == 0

puts "Gallery class can return all galleries"
p Gallery.all.length == 2

puts "Artist knows its paintings"
puts vangogh.paintings.include?(starry_night)

puts "Artist knows all galleries their paintings are in"
p banksy.galleries.count == 2

puts "Artist knows all the cities their paintings are in"
p banksy.cities.include?("NYC")

puts "Artist class can total the years of experience of all artists"
p Artist.total_experience == 118



puts "artist with the highest amount of paintings per year of experience"
p Artist.most_prolific == banksy


puts "Artist can create a painting"
p banksy.create_painting("Best Painting Ever", 34857, moma)

puts "Painting class knows all the paintings"
puts Painting.all.count == 6


puts Painting.total_price

puts "A gallery knows all its paintings"
puts freel.paintings.count == 4

puts "gallery knows its artists"
p freel.artists

puts "Returns the gallery's most expensive painting"
puts freel.most_expensive_painting == starry_night

# binding.pry

puts "Bob Ross rules."

