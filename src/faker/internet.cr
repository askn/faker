module Faker
  class Internet < Base
    def self.email(name = nil)
      [user_name(name), domain_name].join("@")
    end

    uniquify_builder(email, name = nil)

    def self.free_email(name = nil)
      [user_name(name), Faker.fetch(Data["internet"]["free_email"])].join("@")
    end

    uniquify_builder(free_email, name = nil)

    def self.safe_email(name = nil)
      [user_name(name), "example." + %w(org com net).shuffle(Faker.rng).first].join("@")
    end

    uniquify_builder(safe_email, name = nil)

    def self.user_name(specifier = nil, separators = %w(. _))
      if specifier.is_a? String
        return specifier.scan(/\w+/).map { |s| s[0] }.shuffle(Faker.rng).join(separators.sample(Faker.rng)).downcase
      elsif specifier.is_a? Int
        tries = 0 # Don't try forever in case we get something like 1_000_000.
        result = ""
        while (tries < 7)
          result = user_name(nil, separators)
          tries += 1
          unless result.size < specifier
            break
          end
        end
        until result.size >= specifier
          result = result * 2
        end
        return result
      elsif specifier.is_a? Range
        tries = 0
        result = ""
        while (tries < 7)
          result = user_name(specifier.min, separators)
          tries += 1
          break if specifier.includes?(result.size)
        end
        return result[0...specifier.max]
      end

      # return  name.scan(/\w+/).shuffle(Faker.rng).map(&.[0]).join(separators.sample(Faker.rng)).downcase if name
      [
        ->{ Name.first_name.gsub(/\W/, "").downcase },
        ->{
          [Name.first_name, Name.last_name].map { |n|
            n.gsub(/\W/, "")
          }.join(separators.sample(Faker.rng)).downcase
        },
      ].sample(Faker.rng).call
    end

    uniquify_builder(user_name, specifier = nil, separators = %w(. _))

    def self.domain_name
      [domain_word, domain_suffix].join(".")
    end

    uniquify_builder(domain_name)

    def self.domain_word
      Company.name.split(" ").first.gsub(/\W/, "").downcase
    end

    uniquify_builder(domain_word)

    def self.domain_suffix
      Faker.fetch(Data["internet"]["domain_suffix"])
    end

    uniquify_builder(domain_suffix)

    def self.ip_v4_address
      [
        (2..254).to_a.sample(Faker.rng),
        (2..254).to_a.sample(Faker.rng),
        (2..254).to_a.sample(Faker.rng),
        (2..254).to_a.sample(Faker.rng),
      ].join('.')
    end

    uniquify_builder(ip_v4_address)

    def self.ip_v6_address
      ip_v6_space = (0..65535).to_a
      container = (1..8).map { |_| ip_v6_space.sample(Faker.rng) }
      container.map { |n| n.to_s(16) }.join(':')
    end

    uniquify_builder(ip_v6_address)

    def self.mac_address(prefix = "")
      prefix_digits = prefix.split(":").map { |d| d.to_i?(16) ? d.to_i?(16) : 0 }
      address_digits = (1..(6 - prefix_digits.size)).map { Faker.rng.rand(256) }
      (prefix_digits + address_digits).map { |d| "%02x" % d }.join(":")
    end

    uniquify_builder(mac_address, prefix = "")

    def self.url(host = domain_name, path = "/#{user_name}")
      "http://#{host}#{path}"
    end

    uniquify_builder(url, host = domain_name, path = "/#{user_name}")

    def self.slug(words = nil, glue = nil)
      glue ||= %w(- _ .).sample(Faker.rng)
      (words || Lorem.words(2).join(' ')).gsub(' ', glue).downcase
    end

    uniquify_builder(slug, words = nil, glue = nil)

    def self.password(min_length = 8, max_length = 16, mix_case = true, special_chars = false)
      temp = Lorem.characters(min_length)
      diff_length = max_length - min_length
      if diff_length > 0
        diff_rand = Faker.rng.rand(diff_length + 1)
        temp += Lorem.characters(diff_rand)
      end
      temp = temp[0..min_length] if min_length > 0

      if mix_case
        temp = temp.gsub(/.{1,2}/) { |s| s.capitalize }
      end

      if special_chars
        chars = %w(! @ # $ % ^ & *)
        number_of_substitutions = Faker.rng.rand(min_length - 1) + 1 # substitute at least one character
        number_of_substitutions.times do |i|
          temp = temp.sub({temp[i] => chars[Faker.rng.rand(chars.size)]})
        end
      end

      return temp
    end

    uniquify_builder(password, min_length = 8, max_length = 16, mix_case = true, special_chars = false)
  end
end
