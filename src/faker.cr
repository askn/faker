require "./faker/data.cr"
require "./faker/*"

module Faker
  def self.numerify(number_string)
    number_string.sub(/#/) { (rand(9) + 1).to_s }.gsub(/#/) { rand(10).to_s }
  end

  def self.letterify(letter_string)
    letter_string.gsub(/\?/) { ("A".."Z").to_a.sample }
  end

  def self.bothify(string)
    self.letterify(self.numerify(string))
  end

  def self.fetch(data)
    d = data as Array
    d.sample
  end
end
