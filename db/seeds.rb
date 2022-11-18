# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

# User seeds
puts "Cleaning database..."
Booking.destroy_all
User.destroy_all

puts "Creating users..."
hugo = { first_name: 'Hugo',
         last_name: 'Dulac',
         address: 'Hochelaga',
         email: 'hd@gmail.com',
         password: '123456',
         avatar: '' }
jessica = { first_name: 'Jessica',
            last_name: 'Iacovozzi',
            address: 'Lasalle',
            email: 'ji@gmail.com',
            password: '123456',
            avatar: '' }
giovanni = { first_name: 'Giovanni',
             last_name: 'Reid',
             address: 'Rockland',
             email: 'gr@gmail.com',
             password: '123456',
             avatar: '' }
eva = { first_name: 'Eva',
        last_name: 'Roux',
        address: 'Plateau',
        email: 'er@gmail.com',
        password: '123456',
        avatar: '' }

[hugo, jessica, giovanni, eva].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end
puts "Done!"

# Spell seeds
Spell.destroy_all

puts "Creating spells..."
love_bond = { name: "Love Bond",
              user: User.all.sample,
              description: "Make someone fall in love with you",
              location: "92230, Gennevilliers, Hauts-de-Seine, France",
              category: "Love",
              price: "95" }
cook_well = { name: "Cook Well",
              user: User.all.sample,
              description: "Bring out the best taste in you dish, everytime",
              location: "8787 Woodbine Avenue, Markham, Ontario L3R 0P4, Canada",
              price: "65",
              category: "Home" }
disable_stalker = { name: "Disable Stalker",
                    user: User.all.sample,
                    description: "Any stalker who starts following you will suddenly get injured",
                    location: "744 High Street, Kew East Victoria 3102, Australia",
                    price: "110",
                    category: "Social" }
block_mother_in_law = { name: "Block Mother In Law",
                        user: User.all.sample,
                        description: "Any call from your mother in law will be mysteriously  redirected",
                        location: "9050 55th Ave, Queens, NY 11373, USA",
                        category: "900 Parish Loop, Hinesville, Georgia 31313, United States",
                        price: "45" }
always_clean = { name: "Always Clean",
                 user: User.all.sample,
                 description: "Every rooms in your home clean themselves",
                 location: "5454 Toronto Road, Haverhill, Florida 33415, United States",
                 category: "Home",
                 price: "45" }
upgrade_car = { name: "Upgrade Your Car",
                user: User.all.sample,
                description: "Everyone will perceive your car as a Maserati",
                location: "Steinbruchbrücke 0987, 2380 Liesing, Austria",
                category: "Self",
                price: "450" }
background_img = [
  'https://res.cloudinary.com/dppymdnxh/image/upload/v1668616924/spell%20images/vera-velichko-potions-poison-skull-wallpaper_vornxb.jpg',
  'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617000/spell%20images/2306148a6826c3849554ff6e82f358c0_tm8orh.jpg',
  'https://res.cloudinary.com/dppymdnxh/image/upload/v1668616976/spell%20images/bdf4e8e60c1fedae47811e60754532c1_hnmf8b.png'
]
[love_bond, cook_well, disable_stalker, block_mother_in_law, always_clean, upgrade_car].each do |attributes|
  spell = Spell.create!(attributes)
  puts "Created #{spell.name}"
  file = URI.open(background_img.sample)
  spell.photo.attach(io: file, filename: "spell1.jpeg", content_type: 'image/png')
  spell.save
end
puts "Finished!"

# Booking seeds
puts "Cleaning database..."

puts "Creating bookings..."
@bookings = [{ start_date: Date.new(2022, 11, 20),
               end_date: Date.new(2022, 11, 24),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 11, 19),
               end_date: Date.new(2022, 11, 23),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 11, 20),
               end_date: Date.new(2022, 11, 27),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 11, 23),
               end_date: Date.new(2022, 11, 27),
               user: User.all.sample,
               spell: Spell.all.sample }]

@bookings.each do |attributes|
  booking = Booking.create!(attributes)
  puts "Created booking ##{booking.id}"
end
puts "All done!"
