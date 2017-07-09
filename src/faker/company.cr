module Faker
  class Company
    def self.name
      Faker.fetch(Data["company"]["name"])
    end

    def self.suffix
      Faker.fetch(Data["company"]["suffix"])
    end

    def self.catch_phrase
      data = Data["company"]["buzzwords"].as Array(Array(String))
      Faker.fetch(data.flatten)
    end

    def self.bs
      data = Data["company"]["bs"].as Array(Array(String))
      Faker.fetch(data.flatten)
    end

    def self.logo
      rand_num = Faker.rng.rand(13) + 1
      "https://pigment.github.io/fake-logos/logos/medium/color/#{rand_num}.png"
    end
  end
end
