module Faker
  class Team < Base
    def self.name
      Faker.fetch(Data["team"]["name"])
    end

    uniquify_builder(name)

    def self.creature
      Faker.fetch(Data["team"]["creature"])
    end

    uniquify_builder(creature)

    def self.state
      Faker.fetch(Data["address"]["state"])
    end

    uniquify_builder(state)
  end
end
