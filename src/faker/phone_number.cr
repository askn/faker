module Faker
  class PhoneNumber < Base
    def self.phone_number
      Faker.numerify(Faker.fetch(Data["phone_number"]["formats"]))
    end

    uniquify_builder(phone_number)
  end
end
