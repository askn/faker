module Faker
  class Number
    def self.number(digits)
      (1..digits).map { digit }.join ""
    end

    def self.digit
      Faker.rng.rand(10).to_s
    end

    def self.decimal(l_digits, r_digits = 2)
      l_d = number(l_digits)
      r_d = number(r_digits)
      "#{l_d}.#{r_d}"
    end

    def self.between(from = 1.00, to = 5000.00)
      Faker.rand_in_range(from, to)
    end

    def self.positive(from = 1.00, to = 5000.00)
      random_number = between(from, to)
      greater_than_zero(random_number)
    end

    def self.negative(from = -5000.00, to = -1.00)
      random_number = between(from, to)
      less_than_zero(random_number)
    end

    def self.hexadecimal(digits)
      hex = ""
      digits.times { hex += Faker.rng.rand(15).to_s(16) }
      hex
    end

    private def self.greater_than_zero(number)
      if number > 0
        number
      else
        number * -1
      end
    end

    private def self.less_than_zero(number)
      if number < 0
        number
      else
        number * -1
      end
    end
  end
end
