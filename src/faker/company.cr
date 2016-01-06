module Faker
  class Company
    def self.name
      Formats.sample.call
    end

    def self.suffix
      Faker.fetch(Data["company"]["suffix"])
    end

    def self.catch_phrase
      [Faker.fetch(Data["company"]["buzzword_1"]), Faker.fetch(Data["company"]["buzzword_2"]), Faker.fetch(Data["company"]["buzzword_3"])].join(" ")
    end

    def self.bs
      [Faker.fetch(Data["company"]["bs_1"]), Faker.fetch(Data["company"]["bs_2"]), Faker.fetch(Data["company"]["bs_3"])].join(" ")
    end

    Formats = [
      ->{ [Name.last_name, suffix].join(' ') },
      ->{ [Name.last_name, Name.last_name].join('-') },
      ->{ "%s, %s and %s" % [Name.last_name, Name.last_name, Name.last_name] },
    ]
  end
end
