require "./spec_helper"

describe Faker::Date do
  describe "#between" do
    it "should return between date" do
      from = Time.parse("2019-01-01", "%Y-%m-%d", Time::Location::UTC)
      to = Time.parse("2022-01-01", "%Y-%m-%d", Time::Location::UTC)

      100.times do
        random_date = Faker::Date.between(from: from, to: to)
        random_date.should be >= from
        random_date.should be <= to
      end
    end

    it "should raise and exception on invalid date" do
      from = "2019-01-01"
      to = "0000-00-00"

      expect_raises(ArgumentError, "Invalid time") do
        Faker::Date.between(from: from, to: to)
      end
    end
  end

  describe "#between_except" do
    it "should return between date except gvien one" do
      from = "2012-01-01"
      to = "2012-01-05"
      excepted = "2012-01-03"

      100.times do
        random_date = Faker::Date.between_except(from: from, to: to, excepted: excepted)
        random_date.should_not be_nil
        random_date.should_not eq(Time.parse(excepted, "%Y-%m-%d", Time::Location::UTC))
      end
    end

    it "should raise an excpetion when all args are the same" do
      from = "2012-01-01"
      to = "2012-01-01"
      excepted = "2012-01-01"

      expect_raises(ArgumentError, "From date, to date and excepted date must not be the same") do
        Faker::Date.between_except(from: from, to: to, excepted: excepted)
      end
    end
  end

  describe "#birthday" do
    it "should return a birthday" do
      min = 40
      max = 90

      t = Time.utc
      birthday_min = Time.utc(t.year - max, t.month, t.day)
      birthday_max = Time.utc(t.year - min, t.month, t.day)

      100.times do
        birthday = Faker::Date.birthday(min_age: min, max_age: max)

        birthday.should be >= birthday_min
        birthday.should be <= birthday_max
      end
    end

    it "should return today when min_age and max_age are the same" do
      min = 0
      max = 0

      t = Time.utc
      birthday = Faker::Date.birthday(min_age: min, max_age: max)

      birthday.should eq Time.utc(t.year, t.month, t.day)
    end
  end

  it "should return a forward date" do
    today = Time.utc

    100.times do
      random_date = Faker::Date.forward(days: 5)
      random_date.should be > today
    end
  end

  it "should return a backward date" do
    today = Time.utc

    100.times do
      random_date = Faker::Date.backward(days: 5)
      random_date.should be < today
    end
  end

  describe "#date_in_period" do
    it "should work with default params" do
      current_year = Time.utc.year

      10.times do
        date = Faker::Date.in_date_period
        date.year.should eq(current_year)
      end
    end
  end
end
