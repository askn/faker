module Faker
  class Team
    def self.name
      Faker.fetch(Data["team"]["name"])
    end

    def self.creature
      Faker.fetch(Data["team"]["creature"])
    end

    def self.state
      Faker.fetch(Data["address"]["state"])
    end
  end
end
