module Faker
  class Name
    def self.name
      Faker.fetch(Data["name"]["name"])
    end

    {% for data_type in %w(first_name last_name prefix suffix) %}
    def self.{{data_type.id}}
      Faker.fetch(Data["name"]["{{data_type.id}}"])
    end
    {% end %}

    def self.title
      title = Data["name"]["title"] as Hash
      Faker.fetch(title["descriptor"]) + " " + Faker.fetch(title["level"]) + " " + Faker.fetch(title["job"])
    end
  end
end
