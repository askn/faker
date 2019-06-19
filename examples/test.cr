require "../src/faker"

puts "\n### Faker::Address\n\n"

puts Faker::Address.city
puts Faker::Address.street_name
puts Faker::Address.street_address
puts Faker::Address.secondary_address
puts Faker::Address.building_number
puts Faker::Address.zip_code
puts Faker::Address.postcode
puts Faker::Address.time_zone
puts Faker::Address.street_suffix
puts Faker::Address.city_suffix
puts Faker::Address.city_prefix
puts Faker::Address.state
puts Faker::Address.state_abbr
puts Faker::Address.country

puts Faker::Address.latitude
puts Faker::Address.longitude

puts "\n### Faker::Commerce\n\n"

puts Faker::Commerce.color
puts Faker::Commerce.unique_color
puts Faker::Commerce.department
puts Faker::Commerce.unique_department
puts Faker::Commerce.unique_department(2)
puts Faker::Commerce.unique_department(2, true)
puts Faker::Commerce.product_name
puts Faker::Commerce.price
puts Faker::Commerce.unique_price
puts Faker::Commerce.unique_price(0.0..10_000.00)

puts "\n### Faker::Company\n\n"

puts Faker::Company.name
puts Faker::Company.suffix
puts Faker::Company.catch_phrase
puts Faker::Company.bs

puts "\n\t### Faker::Internet\n\n"

puts Faker::Internet.email
puts Faker::Internet.email("Nancy")
puts Faker::Internet.unique_email("Nancy")
puts Faker::Internet.unique_email("Nancy")
puts Faker::Internet.free_email
puts Faker::Internet.unique_free_email
puts Faker::Internet.free_email("Nancy")
puts Faker::Internet.unique_free_email("Nancy")
puts Faker::Internet.safe_email
puts Faker::Internet.unique_safe_email
puts Faker::Internet.safe_email("Nancy")
puts Faker::Internet.unique_safe_email("Nancy")

puts Faker::Internet.user_name
puts Faker::Internet.user_name("Nancy")
puts Faker::Internet.user_name("Nancy Johnson", %w(. _ -))

puts Faker::Internet.password
puts Faker::Internet.password(12)

puts Faker::Internet.domain_name
puts Faker::Internet.domain_word
puts Faker::Internet.domain_suffix

puts Faker::Internet.ip_v4_address

puts Faker::Internet.url
puts Faker::Internet.slug

puts "\n\t### Faker::Lorem\n\n"

puts Faker::Lorem.words
puts Faker::Lorem.words(4)

puts Faker::Lorem.characters
puts Faker::Lorem.characters(10)

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
puts Faker::Name.title

puts "\n\t### Faker::Avatar\n\n"

puts Faker::Avatar.image
puts Faker::Avatar.image("borp")
puts Faker::Avatar.unique_image("borp")
puts Faker::Avatar.unique_image("borp")

puts "\n\t### Faker::Number\n\n"

puts Faker::Number.number(10)
# puts Faker::Number.unique_number(10)
# puts Faker::Number.unique_number(10)
# puts Faker::Number.unique_number(10)
puts Faker::Number.decimal(2)
puts Faker::Number.decimal(2, 3)
puts Faker::Number.unique_decimal(2)
# puts Faker::Number.unique_decimal(2, 3)
puts Faker::Number.digit
puts Faker::Number.unique_digit

puts "\n\t### Faker::PhoneNumber\n\n"

puts Faker::PhoneNumber.phone_number

puts "\n\t### Faker::Business\n\n"

puts Faker::Business.credit_card_number
puts Faker::Business.credit_card_expiry_date
puts Faker::Business.credit_card_type

puts Faker::Business.unique_credit_card_number
puts Faker::Business.unique_credit_card_expiry_date
puts Faker::Business.unique_credit_card_type
