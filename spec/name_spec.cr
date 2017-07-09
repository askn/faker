require "./spec_helper"

describe Faker::Name do
  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Name.name.should eq "Bernie Altenwerth"
    Faker::Name.first_name.should eq "Ron"
    Faker::Name.last_name.should eq "Block"
    Faker::Name.prefix.should eq "Mrs."
    Faker::Name.suffix.should eq "Sr."
    Faker::Name.title.should eq "Product Markets Specialist"
  end
end
