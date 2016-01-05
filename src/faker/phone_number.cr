module Faker
  class PhoneNumber
    def self.phone_number
      Faker.numerify(Data["phone_number"]["formats"].sample)
    end
  end
end
