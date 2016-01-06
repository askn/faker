module Faker
  class Internet
    def self.email(name = nil)
      [user_name(name), domain_name].join("@")
    end

    def self.free_email(name = nil)
      [user_name(name), Faker.fetch(Data["internet"]["free_email"])].join("@")
    end

    def self.safe_email(name = nil)
      [user_name(name), "example." + %w(org com net).shuffle.first].join("@")
    end

    def self.user_name(name = nil)
      return name.scan(/\w+/).shuffle.map(&.[0]).join(%w(. _).sample).downcase if name
      [
        ->{ Name.first_name.gsub(/\W/, "").downcase },
        ->{
          [Name.first_name, Name.last_name].map { |n|
            n.gsub(/\W/, "")
          }.join(".").downcase
        },
      ].sample.call
    end

    def self.domain_name
      [domain_word, domain_suffix].join(".")
    end

    def self.domain_word
      Company.name.split(" ").first.gsub(/\W/, "").downcase
    end

    def self.domain_suffix
      Faker.fetch(Data["internet"]["domain_suffix"])
    end

    def self.ip_v4_address
      [
        (2..254).to_a.sample,
        (2..254).to_a.sample,
        (2..254).to_a.sample,
        (2..254).to_a.sample,
      ].join('.')
    end
  end
end