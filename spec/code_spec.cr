require "./spec_helper"

describe Faker::Code do
  it "base 10 isbn" do
    Faker::Code.isbn.match(/^\d{9}-[\d|X]$/).should_not eq nil
  end

  it "base 13 isbn" do
    Faker::Code.isbn(13).match(/^\d{12}-\d$/).should_not eq nil
  end

  it "imei" do
    Faker::Code.imei.match(/\A[\d.:\-\s]+\z/i).should_not eq nil
  end

  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Code.isbn.should eq "394314441-0"
    Faker::Code.isbn(13).should eq "205982563728-9"
    Faker::Code.imei.should eq "860839366575918"
  end
end
