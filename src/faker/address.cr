module Faker
  class Address < Base
    def self.zip_code
      Faker.numerify(["#####", "#####-####"].sample(Faker.rng))
    end

    uniquify_builder(zip_code)

    {% for data_type in %w(state state_abbr city_suffix city_prefix country street_suffix country_code) %}
    def self.{{data_type.id}}
      Faker.fetch(Data["address"]["{{data_type.id}}"])
    end
    uniquify_builder({{data_type.id}})
    {% end %}

    def self.city
      Faker.fetch(Data["address"]["city"])
    end

    uniquify_builder(city)

    def self.street_name
      [
        ->{ [Name.last_name, street_suffix].join(" ") },
        ->{ [Name.first_name, street_suffix].join(" ") },
      ].sample(Faker.rng).call
    end

    uniquify_builder(street_name)

    def self.street_address
      Faker.numerify([
        ->{ "##### %s" % street_name },
        ->{ "##### %s" % street_name },
        ->{ "##### %s" % street_name },
        ->{ "##### %s" % street_name },
        ->{ "##### %s Apt. ###" % street_name },
        ->{ "##### %s Suite ###" % street_name },
      ].sample(Faker.rng).call)
    end

    uniquify_builder(street_address)

    def self.secondary_address
      Faker.numerify(Faker.fetch(Data["address"]["secondary_address"]))
    end

    uniquify_builder(street_address)

    def self.building_number
      Faker.bothify(Faker.fetch(Data["address"]["building_number"]))
    end

    uniquify_builder(building_number)

    def self.postcode
      Faker.bothify([
        ->{ "??# #??" },
        ->{ "??## #??" },
      ].sample(Faker.rng).call)
    end

    uniquify_builder(postcode)

    def self.latitude
      ((Faker.rng.rand * 180) - 90).to_s
    end

    uniquify_builder(latitude)

    def self.longitude
      ((Faker.rng.rand * 360) - 180).to_s
    end

    uniquify_builder(longitude)

    def self.time_zone
      Faker.fetch(Data["address"]["time_zone"])
    end

    uniquify_builder(time_zone)
  end
end
