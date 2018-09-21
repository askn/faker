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
    Faker::Number.number(10).should eq "9394314441"
    Faker::Number.decimal(2).should eq "12.05"
    Faker::Number.decimal(2, 3).should eq "98.256"
    Faker::Number.hexadecimal(3).should eq "37c"
    Faker::Number.between(1, 10).should eq 9
    Faker::Number.positive.should eq 352.4124353316201
    Faker::Number.negative.should eq -4363.992315679857
    Faker::Number.digit.should eq "9"
  end
end
