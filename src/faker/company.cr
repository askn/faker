module Faker
  class Company
    def self.name
      Formats.sample.call
    end

    def self.suffix
      Faker.fetch(Data["company"]["suffix"])
    end

    Formats = [
      ->{ [Name.last_name, suffix].join(' ') },
      ->{ [Name.last_name, Name.last_name].join('-') },
      ->{ "%s, %s and %s" % [Name.last_name, Name.last_name, Name.last_name] },
    ]
  end
end
