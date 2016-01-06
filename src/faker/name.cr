module Faker
  class Name
    def self.name
      Formats.sample.call.join(" ")
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

    Formats = [
      ->{ [Name.prefix, Name.first_name, Name.last_name] },
      ->{ [Name.first_name, Name.last_name, Name.suffix] },
      ->{ [Name.first_name, Name.last_name] },
      ->{ [Name.first_name, Name.last_name] },
      ->{ [Name.first_name, Name.last_name] },
      ->{ [Name.first_name, Name.last_name] },
      ->{ [Name.first_name, Name.last_name] },
      ->{ [Name.first_name, Name.last_name] },
      ->{ [Name.first_name, Name.last_name] },
      ->{ [Name.first_name, Name.last_name] },
    ]
  end
end
