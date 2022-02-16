module Faker
  class Code < Base
    def self.isbn(base : Int32 = 10)
      case base
      when 10 then generate_base10_isbn
      when 13 then generate_base13_isbn
      else raise ArgumentError.new("base must be 10 or 13")
      end
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
