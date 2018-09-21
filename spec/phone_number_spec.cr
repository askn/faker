require "./spec_helper"

describe Faker::PhoneNumber do
  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::PhoneNumber.phone_number.should eq "894.314.4411 x20598"
  end
end
