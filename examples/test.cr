require "../src/faker"

puts "\n### Faker::Address\n\n"

puts Faker::Address.city
puts Faker::Address.street_name
puts Faker::Address.street_address
puts Faker::Address.secondary_address

puts Faker::Address.zip_code
puts Faker::Address.postcode

puts Faker::Address.street_suffix
puts Faker::Address.city_suffix
puts Faker::Address.city_prefix
puts Faker::Address.state
puts Faker::Address.state_abbr
puts Faker::Address.country

puts Faker::Address.latitude
puts Faker::Address.longitude

puts "\n### Faker::Company\n\n"

puts Faker::Company.name
puts Faker::Company.suffix

puts "\n\t### Faker::Internet\n\n"

puts Faker::Internet.email
puts Faker::Internet.email("Nancy")
puts Faker::Internet.free_email
puts Faker::Internet.free_email("Nancy")

puts Faker::Internet.user_name
puts Faker::Internet.user_name("Nancy")

puts Faker::Internet.domain_name
puts Faker::Internet.domain_word
puts Faker::Internet.domain_suffix

puts Faker::Internet.ip_v4_address

puts "\n\t### Faker::Lorem\n\n"

puts Faker::Lorem.words
puts Faker::Lorem.words(4)

puts Faker::Lorem.sentence
puts Faker::Lorem.sentence(3)

puts Faker::Lorem.sentences
puts Faker::Lorem.sentences(1)

puts Faker::Lorem.paragraph
puts Faker::Lorem.paragraph(2)

puts Faker::Lorem.paragraphs
puts Faker::Lorem.paragraphs(1)

puts "\n\t### Faker::Name\n\n"

puts Faker::Name.name
puts Faker::Name.first_name
puts Faker::Name.last_name
puts Faker::Name.prefix
puts Faker::Name.suffix

puts "\n\t### Faker::PhoneNumber\n\n"

puts Faker::PhoneNumber.phone_number
