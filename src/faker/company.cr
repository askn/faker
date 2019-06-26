module Faker
  class Company < Base
    def self.name
      Faker.fetch(Data["company"]["name"])
    end

    uniquify_builder(name)

    def self.suffix
      Faker.fetch(Data["company"]["suffix"])
    end

    uniquify_builder(suffix)

    def self.catch_phrase
      data = Data["company"]["buzzwords"].as Array(Array(String))
      Faker.fetch(data.flatten)
    end

    uniquify_builder(catch_phrase)

    def self.bs
      data = Data["company"]["bs"].as Array(Array(String))
      Faker.fetch(data.flatten)
    end

    uniquify_builder(bs)

    def self.logo
      rand_num = Faker.rng.rand(13) + 1
      "https://pigment.github.io/fake-logos/logos/medium/color/#{rand_num}.png"
    end

    uniquify_builder(logo)
  end
end
