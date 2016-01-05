require "./faker/data.cr"
require "./faker/*"

module Faker
  def self.numerify(number_string)
    number_string.gsub(/#/) { rand(10).to_s }
  end

  def self.letterify(letter_string)
    letter_string.gsub(/\?/) { ("a".."z").to_a.rand }
  end

  def self.bothify(string)
    self.letterify(self.numerify(string))
  end
end

class Array
  def rand
    self.at(rand(self.size))
  end
end
