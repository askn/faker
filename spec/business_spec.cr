require "./spec_helper"

describe Faker::Business do
  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Business.credit_card_number.should eq "1228-1221-1221-1431"
    Faker::Business.credit_card_expiry_date.should eq Time.new(2013, 9, 12)
    Faker::Business.credit_card_type.should eq "mastercard"
  end
end
