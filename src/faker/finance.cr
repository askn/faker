module Faker
  class Finance
    CREDIT_CARD_TYPES = (Data["credit_card"].as(Hash)).keys

    def self.credit_card(types : Array = [] of Array(String))
      types = CREDIT_CARD_TYPES if types.empty?
      type = types.sample

      template = Faker.numerify(Faker.fetch(Data["credit_card"]["#{type}"]))

      # calculate the luhn checksum digit
      multiplier = 1
      luhn_sum = template.gsub(/[^0-9]/, "").split("").reverse.map(&.to_i).inject(0) do |sum, digit|
        multiplier = (multiplier == 2 ? 1 : 2)
        sum + (digit * multiplier).to_s.split("").map(&.to_i).inject(0) { |digit_sum, cur| digit_sum + cur }
      end
      # the sum plus whatever the last digit is must be a multiple of 10. So, the
      # last digit must be 10 - the last digit of the sum.
      luhn_digit = (10 - (luhn_sum % 10)) % 10

      template = template.gsub "L", luhn_digit.to_s
      template
    end
  end
end
