module Faker
  class Code < Base
    RBI = %w[01 10 30 33 35 44 45 49 50 51 52 53 54 86 91 98 99]

    def self.isbn(base : Int32 = 10)
      case base
      when 10 then generate_base10_isbn
      when 13 then generate_base13_isbn
      else raise ArgumentError.new("base must be 10 or 13")
      end
    end

    def self.imei
      str = Array.new(15, 0)
      sum = 0
      len = 15

      # Fill in the first two values of the string based with the specified prefix.
      arr = RBI.sample(Faker.rng)
      str[0] = arr[0].to_i
      str[1] = arr[1].to_i
      pos = 2

      # Fill all the remaining numbers except for the last one with random values.
      while pos < (len - 1)
        str[pos] = Faker.rng.rand(0..9)
        pos += 1
      end

      # Calculate the Luhn checksum of the values thus far
      len_offset = (len + 1) % 2
      (0..(len - 1)).each do |position|
        if (position + len_offset).odd?
          t = str[position] * 2

          t -= 9 if t > 9

          sum += t
        else
          sum += str[position]
        end
      end
      str[len - 1] = (10 - (sum % 10)) % 10

      str.join("")
    end

    private def self.generate_base10_isbn
      values = Faker.regexify(/\d{9}/)
      remainder = sum(values) { |value, index| (index + 1) * value.to_i } % 11
      values += "-#{remainder == 10 ? 'X' : remainder}"
    end

    private def self.generate_base13_isbn
      values = Faker.regexify(/\d{12}/)
      remainder = sum(values) { |value, index| index.even? ? value.to_i : value.to_i * 3 } % 10
      values += "-#{(10 - remainder) % 10}"
    end

    private def self.sum(values)
      values.split(//).each_with_index.reduce(0) do |sum, (value, index)|
        sum + yield(value, index)
      end
    end
  end
end
