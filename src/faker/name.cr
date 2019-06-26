module Faker
  class Name < Base
    {% for data_type in %w(first_name last_name name prefix suffix) %}
      def self.{{data_type.id}}
        Faker.fetch(Data["name"]["{{data_type.id}}"])
      end
      uniquify_builder({{data_type.id}})
    {% end %}

    def self.title
      title = Data["name"]["title"].as Hash
      Faker.fetch(title["descriptor"]) + " " + Faker.fetch(title["level"]) + " " + Faker.fetch(title["job"])
    end

    uniquify_builder(title)
  end
end
