module Faker
  class Internet
    def self.email(name = nil)
      [user_name(name), domain_name].join("@")
    end

    def self.free_email(name = nil)
      [user_name(name), %w(gmail.com yahoo.com hotmail.com).rand].join("@")
    end

    def self.user_name(name = nil)
      return name.scan(/\w+/).shuffle.map(&.[0]).join(%w(. _).rand).downcase if name
      [
        ->{ Name.first_name.gsub(/\W/, "").downcase },
        ->{
          [Name.first_name, Name.last_name].map { |n|
            n.gsub(/\W/, "")
          }.join(".").downcase
        },
      ].rand.call
    end

    def self.domain_name
      [domain_word, domain_suffix].join(".")
    end

    def self.domain_word
      Company.name.split(" ").first.gsub(/\W/, "").downcase
    end

    def self.domain_suffix
      %w(co.uk com us ca biz info name).rand
    end

    def self.ip_v4_address
      [
        (0..255).to_a.rand,
        (0..255).to_a.rand,
        (0..255).to_a.rand,
        (0..255).to_a.rand,
      ].join('.')
    end
  end
end
