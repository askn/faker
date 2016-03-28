module Faker
  class Address
    def self.zip_code
      Faker.numerify(["#####", "#####-####"].sample)
    end

    {% for data_type in %w(state state_abbr city_suffix city_prefix country street_suffix country_code) %}
    def self.{{data_type.id}}
      Faker.fetch(Data["address"]["{{data_type.id}}"])
    end
    {% end %}

    def self.city
      Faker.fetch(Data["address"]["city"])
    end

    def self.street_name
      [
        ->{ [Name.last_name, street_suffix].join(" ") },
        ->{ [Name.first_name, street_suffix].join(" ") },
      ].sample.call
    end

    def self.street_address
      Faker.numerify([
        ->{ "##### %s" % street_name },
        ->{ "##### %s" % street_name },
        ->{ "##### %s" % street_name },
        ->{ "##### %s" % street_name },
        ->{ "##### %s Apt. ###" % street_name },
        ->{ "##### %s Suite ###" % street_name },
      ].sample.call)
    end

    def self.secondary_address
      Faker.numerify(Faker.fetch(Data["address"]["secondary_address"]))
    end

    def self.building_number
      Faker.bothify(Faker.fetch(Data["address"]["building_number"]))
    end

    def self.postcode
      Faker.bothify([
        ->{ "??# #??" },
        ->{ "??## #??" },
      ].sample.call)
    end

    def self.latitude
      ((rand * 180) - 90).to_s
    end

    def self.longitude
      ((rand * 360) - 180).to_s
    end

    def self.time_zone
      Faker.fetch(Data["address"]["time_zone"])
    end
  end
end
