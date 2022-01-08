module Faker
  class Date < Base
    def self.between(from : Time | String, to : Time | String) : Time
      from = parse_date(from)
      to = parse_date(to)

      Time.unix(Faker.rand_in_range(from.to_unix, to.to_unix)).at_beginning_of_day
    end

    def self.between_except(from : Time | String, to : Time | String, excepted : Time | String)
      raise ArgumentError.new("From date, to date and excepted date must not be the same") if from == to && to == excepted

      excepted = parse_date(excepted)

      loop do
        date = between(from: from, to: to)
        return date if date != excepted
      end
    end

    def self.birthday(min_age : Int32 = 18, max_age : Int32 = 65) : Time
      today = Time.utc

      from = birthday_date(today, max_age)
      to = birthday_date(today, min_age)

      between(from, to)
    end

    def self.forward(days : Int32 = 365) : Time
      from = Time.utc + 1.day
      to   = Time.utc + days.days

      between(from: from, to: to)
    end

    def self.backward(days : Int32 = 365) : Time
      from = Time.utc - days.days
      to   = Time.utc - 1.day

      between(from: from, to: to)
    end

    def self.in_date_period(month : Int32? = nil, year : Int32 = Time.utc.year) : Time
      from = Time.utc(year, month || 1, 1)

      to_month = month || 12
      end_day = Time.utc(year, to_month, 1).at_end_of_month.day
      to = Time.utc(year, to_month, end_day)

      between(from: from, to: to)
    end

    private def self.parse_date(date : String) : Time
      Time.parse(date, "%Y-%m-%d", Time::Location::UTC)
    end

    private def self.parse_date(date : Time) : Time
      date
    end

    private def self.birthday_date(date : Time, age : Int32) : Time
      year = date.year - age
      day =
        if date.day == 29 && date.month == 2 && Time.leap_year?(year)
          28
        else
          date.day
        end

      Time.utc(year, date.month, day)
    end
  end
end
