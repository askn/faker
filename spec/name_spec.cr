require "./spec_helper"

describe Faker::Name do
  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Name.name.should eq "Danyka Gleichner DDS"
    Faker::Name.first_name.should eq "Molly"
    Faker::Name.last_name.should eq "Fay"
    Faker::Name.prefix.should eq "Dr."
    Faker::Name.suffix.should eq "DDS"
    Faker::Name.title.should eq "Direct Markets Associate"
  end
end
