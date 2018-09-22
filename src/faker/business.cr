module Faker
  class Business < Base
    def self.credit_card_number
      Faker.fetch(Data["business"]["credit_card_numbers"])
    end

    uniquify_builder(credit_card_numer)

    def self.credit_card_expiry_date
      credit_card_expiry_date = Faker.fetch(Data["business"]["credit_card_expiry_dates"]).as String
      Time.parse_local(credit_card_expiry_date, "%Y-%m-%d")
    end

    uniquify_builder(credit_card_expiry_date)

    def self.credit_card_type
      Faker.fetch(Data["business"]["credit_card_types"])
    end

    uniquify_builder(credit_card_type)
  end
end
