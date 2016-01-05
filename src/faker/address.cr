module Faker
  class Address
    def self.zip_code
      Faker.numerify(["#####", "#####-####"].rand)
    end

    {% for data_type in %w(state state_abbr city_suffix city_prefix country street_suffix) %}
    def self.{{data_type.id}}
      Faker::Data["{{data_type.id}}"].rand
    end
    {% end %}

    def self.city
      [
        "%s %s%s" % [city_prefix, Name.first_name, city_suffix],
        "%s %s" % [city_prefix, Name.first_name],
        "%s%s" % [Name.first_name, city_suffix],
        "%s%s" % [Name.last_name, city_suffix],
      ].rand
    end

    def self.street_name
      [
        ->{ [Name.last_name, street_suffix].join(" ") },
        ->{ [Name.first_name, street_suffix].join(" ") },
      ].rand.call
    end

    def self.street_address
      Faker.numerify([
        ->{ "##### %s" % street_name },
        ->{ "##### %s" % street_name },
        ->{ "##### %s" % street_name },
        ->{ "##### %s" % street_name },
        ->{ "##### %s Apt. ###" % street_name },
        ->{ "##### %s Suite ###" % street_name },
      ].rand.call)
    end

    def self.secondary_address
      Faker.numerify([
        "Apt. ###",
        "Suite ###",
      ].rand)
    end

    def self.postcode
      Faker.bothify([
        ->{ "??# #??" },
        ->{ "??## #??" },
      ].rand.call).upcase
    end
  end
end
