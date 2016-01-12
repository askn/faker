require "./data.cr"
require "./faker/*"

module Faker
  def self.numerify(number_string)
    number_string = number_string as String
    number_string.sub(/#/) { (rand(9) + 1).to_s }.gsub(/#/) { rand(10).to_s }
  end

  def self.letterify(letter_string)
    letter_string.gsub(/\?/) { ("A".."Z").to_a.sample }
  end

  def self.bothify(string)
    self.letterify(self.numerify(string))
  end

  def self.regexify(re)
    re.gsub(/^\/?\^?/, "").gsub(/\$?\/?$/, "")                                                                                              # Ditch the anchors
.gsub(/\{(\d+)\}/, "{\1,\1}").gsub(/\?/, "{0,1}")                                                                                           # All {2} become {2,2} and ? become {0,1}
.gsub(/(\[[^\]]+\])\{(\d+),(\d+)\}/) { |match| $1 * ($2.to_i..$3.to_i).to_a.sample }                                                        # [12]{1,2} becomes [12] or [12][12]
.gsub(/(\([^\)]+\))\{(\d+),(\d+)\}/) { |match| $1 * ($2.to_i..$3.to_i).to_a.sample }                                                        # (12|34){1,2} becomes (12|34) or (12|34)(12|34)
.gsub(/(\\?.)\{(\d+),(\d+)\}/) { |match| $1 * ($2.to_i..$3.to_i).to_a.sample }                                                              # A{1,2} becomes A or AA or \d{3} becomes \d\d\d
.gsub(/\((.*?)\)/) { |match| match.gsub(/[\(\)]/, "").split("|").sample }                                                                   # (this|that) becomes "this" or "that"
.gsub(/\[([^\]]+)\]/) { |match| match.gsub(/(\w\-\w)/) { |range| ((0..range.size).map { |i| range[i] }).join("").split("-").to_a.sample } } # All A-Z inside of [] become C (or X, or whatever)
.gsub(/\[([^\]]+)\]/) { |match| $1.split("").sample }                                                                                       # All [ABC] become B (or A or C)
.gsub("\d") { |match| (0..9).to_a.sample }
.gsub("\w") { |match| (("A".."Z").to_a + (0..9).to_a).sample }
  end

  def self.fetch(data)
    d = data as Array
    d.sample
  end
end
