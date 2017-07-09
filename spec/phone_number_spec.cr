require "./spec_helper"

describe Faker::PhoneNumber do
  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::PhoneNumber.phone_number.should eq "361-710-4228 x23421"
  end
end
