module Faker
  class Company
    def self.name
      Formats.rand.call
    end

    def self.suffix
      %w(Inc and\ Sons LLC Group).rand
    end

    Formats = [
      ->{ [Name.last_name, suffix].join(' ') },
      ->{ [Name.last_name, Name.last_name].join('-') },
      ->{ "%s, %s and %s" % [Name.last_name, Name.last_name, Name.last_name] },
    ]
  end
end
