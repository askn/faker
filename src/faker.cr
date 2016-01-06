require "./faker/data.cr"
require "./faker/*"

module Faker
  def self.numerify(number_string)
    number_string.gsub(/#/) { rand(10).to_s }
  end

  def self.letterify(letter_string)
    letter_string.gsub(/\?/) { ("a".."z").to_a.sample }
  end

  def self.bothify(string)
    self.letterify(self.numerify(string))
  end

  def self.fetch(data)
    d = data as Array
    d.sample
  end
end
