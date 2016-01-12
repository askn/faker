# faker

This shard is a port of [Faker](https://github.com/stympy/faker) gem that generates fake data.


## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  faker:
    github: askn/faker
```

## Usage

```crystal
require "faker"

Faker::Name.name
```

### Faker::Address

```crystal
Faker::Address.city #=> "Imogeneborough"

Faker::Address.street_name #=> "Larkin Fork"

Faker::Address.street_address #=> "282 Kevin Brook"

Faker::Address.secondary_address #=> "Apt. 672"

Faker::Address.building_number #=> "7304"

Faker::Address.zip_code #=> "58517"

Faker::Address.postcode #=> "58517"

Faker::Address.time_zone #=> "Asia/Yakutsk"

Faker::Address.street_suffix #=> "Street"

Faker::Address.city_suffix #=> "fort"

Faker::Address.city_prefix #=> "Lake"

Faker::Address.state #=> "California"

Faker::Address.state_abbr #=> "AP"


Faker::Address.country #=> "French Guiana"

Faker::Address.latitude #=> "-58.17256227443719"

Faker::Address.longitude #=> "-156.65548382095133"
```

### Faker::Business
------------------

```crystal

Faker::Business.credit_card_number #=> "1228-1221-1221-1431"

Faker::Business.credit_card_expiry_date #=> <Time: 2015-11-11>

Faker::Business.credit_card_type #=> "visa"

```


### Faker::Commerce

```crystal

Faker::Commerce.color #=> "lavender"

Faker::Commerce.department #=> "Grocery, Health & Beauty"
Faker::Commerce.product_name #=> "Practical Granite Shirt"

Faker::Commerce.price #=> "44.6"

```

### Faker::Company

```crystal

Faker::Company.name #=> "Hirthe-Ritchie"

Faker::Company.suffix #=> "Group"

```


### Faker::Internet

```crystal
# Optional argument name=nil
Faker::Internet.email #=> "eliza@mann.net"

Faker::Internet.email('Nancy') #=> "nancy@terry.biz"

# Optional argument name=nil
Faker::Internet.free_email #=> "freddy@gmail.com"

Faker::Internet.free_email('Nancy') #=> "nancy@yahoo.com"

# Optional argument name=nil
Faker::Internet.safe_email #=> "christelle@example.org"

Faker::Internet.safe_email('Nancy') #=> "nancy@example.net"

# Optional arguments specifier=nil, separators=%w(. _)
Faker::Internet.user_name #=> "alexie"

Faker::Internet.user_name('Nancy') #=> "nancy"

Faker::Internet.user_name('Nancy Johnson', %w(. _ -)) #=> "johnson-nancy"

# Optional argument min_length=0
Faker::Internet.password #=> "doloremquealiquidrerum"

Faker::Internet.password(8) #=> "consecteturadasperiores"

Faker::Internet.domain_name #=> "effertz.info"

Faker::Internet.domain_word #=> "haleyziemann"

Faker::Internet.domain_suffix #=> "info"

Faker::Internet.ip_v4_address #=> "24.29.18.175"

Faker::Internet.ip_v6_address #=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df"

# Optional arguments: host=domain_name, path="/#{user_name}"
Faker::Internet.url #=> "http://thiel.com/chauncey_simonis"

# Optional arguments: words=nil, glue=nil
Faker::Internet.slug #=> "pariatur_laudantium"
Faker::Internet.slug('foo bar') #=> "foo.bar"
Faker::Internet.slug('foo bar', '-') #=> "foo-bar"

```

### Faker::Lorem

```crystal

Faker::Lorem.word #=> "repellendus"

# Optional arguments: num=3, supplemental=false
Faker::Lorem.words #=> ["dolores", "adipisci", "nesciunt"]
Faker::Lorem.words(4) #=> ["culpa", "recusandae", "aut", "omnis"]
Faker::Lorem.words(4, true) #=> ["colloco", "qui", "vergo", "deporto"]

# Optional arguments: char_count=255
Faker::Lorem.characters #=> "uw1ep04lhs0c4d931n1jmrspprf5wrj85fefue0y7y6m56b6omquh7br7dhqijwlawejpl765nb1716idmp3xnfo85v349pzy2o9rir23y2qhflwr71c1585fnynguiphkjm8p0vktwitcsm16lny7jzp9t4drwav3qmhz4yjq4k04x14gl6p148hulyqioo72tf8nwrxxcclfypz2lc58lsibgfe5w5p0xv95peafjjmm2frkhdc6duoky0aha"
Faker::Lorem.characters(10) #=> "ang9cbhoa8"

# Optional arguments: word_count=4, supplemental=false, random_words_to_add=6
Faker::Lorem.sentence #=> "Dolore illum animi et neque accusantium."
Faker::Lorem.sentence(3) #=> "Commodi qui minus deserunt sed vero quia."
Faker::Lorem.sentence(3, true) #=> "Inflammatio denego necessitatibus caelestis autus illum."
# Optional arguments: sentence_count=3, supplemental=false
Faker::Lorem.sentences #=> ["Vero earum commodi soluta.", "Quaerat fuga cumque et vero eveniet omnis ut.", "Cumque sit dolor ut est consequuntur."]
Faker::Lorem.sentences(1) #=> ["Ut perspiciatis explicabo possimus doloribus enim quia."]
Faker::Lorem.sentences(1, true) #=> ["Quis capillus curo ager veritatis voro et ipsum."]

# Optional arguments: sentence_count=3, supplemental=false, random_sentences_to_add=3
Faker::Lorem.paragraph #=> "Neque dicta enim quasi. Qui corrupti est quisquam. Facere animi quod aut. Qui nulla consequuntur consectetur sapiente."
Faker::Lorem.paragraph(2) #=> "Illo qui voluptas. Id sit quaerat enim aut cupiditate voluptates dolorum. Porro necessitatibus numquam dolor quia earum."
Faker::Lorem.paragraph(2, true) #=> ""

# Optional arguments: paragraph_count=3, supplemental=false
Faker::Lorem.paragraphs #=> ""
Faker::Lorem.paragraphs(1) #=> ""
Faker::Lorem.paragraphs(1, true) #=> ""

```

### Faker::Name

```crystal
Faker::Name.name #=> "Tyshawn Johns Sr."

Faker::Name.first_name #=> "Kaci"

Faker::Name.last_name #=> "Ernser"

Faker::Name.prefix #=> "Mr."

Faker::Name.suffix #=> "IV"

Faker::Name.title #=> "Legacy Creative Director"

```

### Faker::Number

```crystal

# Required parameter: digits
Faker::Number.number(10) #=> "1968353479"

# Required parameter: l_digits
Faker::Number.decimal(2) #=> "11.88"

Faker::Number.decimal(2, 3) #=> "18.843"


Faker::Number.digit #=> "1"

```

### Faker::PhoneNumber

```crystal

Faker::PhoneNumber.phone_number #=> "397.693.1309"

```


## Contributing

1. Fork it ( https://github.com/askn/faker/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am "Add some feature")
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [askn](https://github.com/askn) Aşkın Gedik - creator, maintainer
