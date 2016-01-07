module Faker
  class Number
    def self.number(digits)
      (1..digits).map { digit }.join ""
    end

    def self.digit
      rand(10).to_s
    end

    def self.decimal(l_digits, r_digits = 2)
      l_d = number(l_digits)
      r_d = number(r_digits)
      "#{l_d}.#{r_d}"
    end
  end
end
