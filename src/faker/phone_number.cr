module Faker
  class PhoneNumber
    def self.phone_number
      Faker.numerify(Faker.fetch(Data["phone_number"]["formats"]))
    end
  end
end
