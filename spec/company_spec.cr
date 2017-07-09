require "./spec_helper"
require "http/client"

describe Faker::Company do
  it "logo" do
    Faker::Company.logo.match(%r{https://pigment.github.io/fake-logos/logos/medium/color/\d+\.png}).should_not eq nil
  end

  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Company.name.should eq "Larson-Altenwerth"
    Faker::Company.suffix.should eq "Group"
    Faker::Company.logo.should eq "https://pigment.github.io/fake-logos/logos/medium/color/12.png"
  end
end
