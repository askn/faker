require "../src/faker"

p "### Faker::Address"

p Faker::Address.city # => "Imogeneborough"

p Faker::Address.street_name # => "Larkin Fork"

p Faker::Address.street_address # => "282 Kevin Brook"

p Faker::Address.secondary_address # => "Apt. 672"

p Faker::Address.building_number # => "7304"

p Faker::Address.zip_code # => "58517"

p Faker::Address.postcode # => "58517"

p Faker::Address.time_zone # => "Asia/Yakutsk"

p Faker::Address.street_suffix # => "Street"

p Faker::Address.city_suffix # => "fort"

p Faker::Address.city_prefix # => "Lake"

p Faker::Address.state # => "California"

p Faker::Address.state_abbr # => "AP"

p Faker::Address.country # => "French Guiana"

p Faker::Address.latitude # => "-58.17256227443719"

p Faker::Address.longitude # => "-156.65548382095133"

p "### Faker::Business"

p Faker::Business.credit_card_number # => "1228-1221-1221-1431"

p Faker::Business.credit_card_expiry_date # => <Time: 2015-11-11>

p Faker::Business.credit_card_type # => "visa"

p "### Faker::Commerce"

p Faker::Commerce.color # => "lavender"

p Faker::Commerce.department   # => "Grocery, Health & Beauty"
p Faker::Commerce.product_name # => "Practical Granite Shirt"

p Faker::Commerce.price # => "44.6"

p "### Faker::Company"

p Faker::Company.name # => "Hirthe-Ritchie"

p Faker::Company.suffix # => "Group"

p Faker::Company.logo # => "https://pigment.github.com/fake-logos/logos/medium/color/5.png"

p "### Faker::Internet"

# Optional argument name=nil
p Faker::Internet.email # => "eliza@mann.net"

p Faker::Internet.email("Nancy") # => "nancy@terry.biz"

# Optional argument name=nil
p Faker::Internet.free_email # => "freddy@gmail.com"

p Faker::Internet.free_email("Nancy") # => "nancy@yahoo.com"

# Optional argument name=nil
p Faker::Internet.safe_email # => "christelle@example.org"

p Faker::Internet.safe_email("Nancy") # => "nancy@example.net"

# Optional arguments specifier=nil, separators=%w(. _)
p Faker::Internet.user_name # => "alexie"

p Faker::Internet.user_name("Nancy") # => "nancy"

p Faker::Internet.user_name("Nancy Johnson", %w(. _ -)) # => "johnson-nancy"

# Optional argument min_length=0
p Faker::Internet.password # => "doloremquealiquidrerum"

p Faker::Internet.password(8) # => "consecteturadasperiores"

p Faker::Internet.domain_name # => "effertz.info"

p Faker::Internet.domain_word # => "haleyziemann"

p Faker::Internet.domain_suffix # => "info"

p Faker::Internet.ip_v4_address # => "24.29.18.175"

p Faker::Internet.ip_v6_address # => "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df"

# Optional argument prefix=""
p Faker::Internet.mac_address             # => "e6:0d:00:11:ed:4f"
p Faker::Internet.mac_address("55:44:33") # => "55:44:33:02:1d:9b"

# Optional arguments: host=domain_name, path="/#{user_name}"
p Faker::Internet.url                                # => "http://thiel.com/chauncey_simonis"
p Faker::Internet.url("example.com")                 # => "http://example.com/clotilde.swift"
p Faker::Internet.url("example.com", "/foobar.html") # => "http://example.com/foobar.html"

# Optional arguments: words=nil, glue=nil
p Faker::Internet.slug                 # => "pariatur_laudantium"
p Faker::Internet.slug("foo bar")      # => "foo.bar"
p Faker::Internet.slug("foo bar", "-") # => "foo-bar"

p "### Faker::Lorem"

p Faker::Lorem.word # => "repellendus"

# Optional arguments: num=3, supplemental=false
p Faker::Lorem.words          # => ["dolores", "adipisci", "nesciunt"]
p Faker::Lorem.words(4)       # => ["culpa", "recusandae", "aut", "omnis"]
p Faker::Lorem.words(4, true) # => ["colloco", "qui", "vergo", "deporto"]

# Optional arguments: char_count=255
p Faker::Lorem.characters     # => "uw1ep04lhs0c4d931n1jmrspprf5wrj85fefue0y7y6m56b6omquh7br7dhqijwlawejpl765nb1716idmp3xnfo85v349pzy2o9rir23y2qhflwr71c1585fnynguiphkjm8p0vktwitcsm16lny7jzp9t4drwav3qmhz4yjq4k04x14gl6p148hulyqioo72tf8nwrxxcclfypz2lc58lsibgfe5w5p0xv95peafjjmm2frkhdc6duoky0aha"
p Faker::Lorem.characters(10) # => "ang9cbhoa8"

# Optional arguments: word_count=4, supplemental=false, random_words_to_add=6
p Faker::Lorem.sentence              # => "Dolore illum animi et neque accusantium."
p Faker::Lorem.sentence(3)           # => "Commodi qui minus deserunt sed vero quia."
p Faker::Lorem.sentence(3, true)     # => "Inflammatio denego necessitatibus caelestis autus illum."
p Faker::Lorem.sentence(3, false, 4) # => "Aut voluptatem illum fugit ut sit."
p Faker::Lorem.sentence(3, true, 4)  # => "Accusantium tantillus dolorem timor."

# Optional arguments: sentence_count=3, supplemental=false
p Faker::Lorem.sentences          # => ["Vero earum commodi soluta.", "Quaerat fuga cumque et vero eveniet omnis ut.", "Cumque sit dolor ut est consequuntur."]
p Faker::Lorem.sentences(1)       # => ["Ut perspiciatis explicabo possimus doloribus enim quia."]
p Faker::Lorem.sentences(1, true) # => ["Quis capillus curo ager veritatis voro et ipsum."]

# Optional arguments: sentence_count=3, supplemental=false, random_sentences_to_add=3
p Faker::Lorem.paragraph              # => "Neque dicta enim quasi. Qui corrupti est quisquam. Facere animi quod aut. Qui nulla consequuntur consectetur sapiente."
p Faker::Lorem.paragraph(2)           # => "Illo qui voluptas. Id sit quaerat enim aut cupiditate voluptates dolorum. Porro necessitatibus numquam dolor quia earum."
p Faker::Lorem.paragraph(2, true)     # => ""
p Faker::Lorem.paragraph(2, false, 4) # => "Neque aut et nemo aut incidunt voluptates. Dolore cum est sint est. Vitae assumenda porro odio dolores fugiat. Est voluptatum quia rerum."
p Faker::Lorem.paragraph(2, true, 4)  # => "Vomito unde uxor annus. Et patior utilis sursum."

# Optional arguments: paragraph_count=3, supplemental=false
p Faker::Lorem.paragraphs          # => ""
p Faker::Lorem.paragraphs(1)       # => ""
p Faker::Lorem.paragraphs(1, true) # => ""

p "### Faker::Name"

p Faker::Name.name # => "Tyshawn Johns Sr."

p Faker::Name.first_name # => "Kaci"

p Faker::Name.last_name # => "Ernser"

p Faker::Name.prefix # => "Mr."

p Faker::Name.suffix # => "IV"

p Faker::Name.title # => "Legacy Creative Director"

p "### Faker::Number"

# Required parameter: digits
p Faker::Number.number(10) # => "1968353479"

# Required parameter: l_digits
p Faker::Number.decimal(2) # => "11.88"

p Faker::Number.decimal(2, 3) # => "18.843"

p Faker::Number.digit # => "1"

p "### Faker::PhoneNumber"

p Faker::PhoneNumber.phone_number # => "397.693.1309"

p "### Faker::Team"

# Random Team Creature
p Faker::Team.creature # => "gooses"

# Random Team Name created from random US State (Faker::Address.state) prepended to a random Team Creature
p Faker::Team.name # => "Oregon vixens"

# Random Team State
p Faker::Team.state # => "Oregon"

# ---
# Required parameter: digits
p Faker::Number.number(10) # => "1968353479"

# Required parameter: l_digits
p Faker::Number.decimal(2) # => "11.88"

p Faker::Number.decimal(2, 3) # => "18.843"

# Required parameter: digits
p Faker::Number.hexadecimal(3) # => "e74"

p Faker::Number.between(1, 10) # => 7

p Faker::Number.positive # => 235.59238499107653

p Faker::Number.negative # => -4480.042585669558

p Faker::Number.digit # => "1"

p Faker::Address.country_code # => "IT"
