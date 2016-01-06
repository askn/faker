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
Faker::Address.city
Faker::Address.street_name
Faker::Address.street_address
Faker::Address.secondary_address
Faker::Address.building_number
Faker::Address.zip_code
Faker::Address.postcode
Faker::Address.time_zone
Faker::Address.street_suffix
Faker::Address.city_suffix
Faker::Address.city_prefix
Faker::Address.state
Faker::Address.state_abbr
Faker::Address.country

Faker::Address.latitude
Faker::Address.longitude

```

### Faker::Company

```crystal
Faker::Company.name
Faker::Company.suffix
```

### Faker::Internet

```crystal
Faker::Internet.email
Faker::Internet.email("Nancy")
Faker::Internet.free_email
Faker::Internet.free_email("Nancy")
Faker::Internet.safe_email
Faker::Internet.safe_email("Nancy")
Faker::Internet.user_name
Faker::Internet.user_name("Nancy")

Faker::Internet.domain_name
Faker::Internet.domain_word
Faker::Internet.domain_suffix

Faker::Internet.ip_v4_address
```

### Faker::Lorem

```crystal
Faker::Lorem.words
Faker::Lorem.words(4)
Faker::Lorem.words(4, true)

Faker::Lorem.characters
Faker::Lorem.characters(10)

Faker::Lorem.sentence
Faker::Lorem.sentence(3)
Faker::Lorem.sentence(3, true)

Faker::Lorem.sentences
Faker::Lorem.sentences(1)
Faker::Lorem.sentences(1, true)

Faker::Lorem.paragraph
Faker::Lorem.paragraph(2)
Faker::Lorem.paragraph(2, true)

Faker::Lorem.paragraphs
Faker::Lorem.paragraphs(1)
Faker::Lorem.paragraphs(1, true)
```

### Faker::Name

```crystal
Faker::Name.name
Faker::Name.first_name
Faker::Name.last_name
Faker::Name.prefix
Faker::Name.suffix
Faker::Name.title
```

### Faker::PhoneNumber

```crystal
Faker::PhoneNumber.phone_number
```


## Contributing

1. Fork it ( https://github.com/askn/faker/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am "Add some feature")
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [askn](https://github.com/askn) Aşkın Gedik - creator, maintainer
