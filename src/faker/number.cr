module Faker
  class Number
    def self.number(digits)
      (1..digits).map { digit }.join ""
    end

    def self.digit
      rand(10).to_s
    end
  end
end
