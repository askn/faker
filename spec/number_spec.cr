require "./spec_helper"

describe Faker::Number do
  it "number" do
    Faker::Number.number(10).match(/[0-9]{10}/).should_not eq nil
    10.times do |digits|
      digits += 1
      Faker::Number.number(digits).match(/^[0-9]{#{digits}}$/).should_not eq nil
    end
  end

  it "decimal" do
    Faker::Number.decimal(2).match(/[0-9]{2}\.[0-9]{2}/).should_not eq nil
    Faker::Number.decimal(4, 5).match(/[0-9]{4}\.[0-9]{5}/).should_not eq nil
  end

  it "digit" do
    Faker::Number.digit.match(/[0-9]{1}/).should_not eq nil
  end

  it "between" do
    100.times do
      random_number = Faker::Number.between(-50, 50)
      (random_number >= -50).should eq true
      (random_number <= 50).should eq true
    end
  end

  it "positive" do
    100.times do
      random_number = Faker::Number.positive(1, 100)
      (random_number >= 1).should be_true
      (random_number <= 100).should be_true
    end
  end

  it "negative" do
    100.times do
      random_number = Faker::Number.negative(-1, -100)
      (random_number <= -1).should be_true
      (random_number >= -100).should be_true
    end
  end

  it "force_positive" do
    random_number = Faker::Number.positive(-1, -100)
    (random_number >= 1).should be_true
    (random_number <= 100).should be_true
  end

  it "force_negative" do
    random_number = Faker::Number.negative(1, 100)
    (random_number <= -1).should be_true
    (random_number >= -100).should be_true
  end

  it "parameters_order" do
    random_number = Faker::Number.between(100, 1)
    (random_number >= 1).should be_true
    (random_number <= 100).should be_true
  end

  it "hexadecimal" do
    Faker::Number.hexadecimal(4).match(/[0-9a-f]{4}/).should_not eq nil
    Faker::Number.hexadecimal(7).match(/[0-9a-f]{7}/).should_not eq nil
  end

  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Number.number(10).should eq "6961710422"
    Faker::Number.decimal(2).should eq "82.34"
    Faker::Number.decimal(2, 3).should eq "21.217"
    Faker::Number.hexadecimal(3).should eq "046"
    Faker::Number.between(1, 10).should eq 2
    Faker::Number.positive.should eq 3995.8054520295627
    Faker::Number.negative.should eq -748.5527873256278
    Faker::Number.digit.should eq "2"
  end
end
