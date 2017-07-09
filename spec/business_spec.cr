require "./spec_helper"

describe Faker::Business do
  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Business.credit_card_number.should eq "1234-2121-1221-1211"
    Faker::Business.credit_card_expiry_date.should eq Time.new(2013, 9, 12)
    Faker::Business.credit_card_type.should eq "diners_club"
  end
end
