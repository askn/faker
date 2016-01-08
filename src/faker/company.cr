module Faker
  class Company
    def self.name
      Formats.sample.call
    end

    def self.suffix
      Faker.fetch(Data["company"]["suffix"])
    end

    def self.catch_phrase
      data = Data["company"]["buzzwords"] as Array(Array(String))
      Faker.fetch(data.flatten)
    end

    def self.bs
      data = Data["company"]["bs"] as Array(Array(String))
      Faker.fetch(data.flatten)
    end

    Formats = [
      ->{ [Name.last_name, suffix].join(" ") },
      ->{ [Name.last_name, Name.last_name].join("-") },
      ->{ "%s, %s and %s" % [Name.last_name, Name.last_name, Name.last_name] },
    ]
  end
end
