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
end
