require "./data.cr"
require "./faker/*"

module Faker
  class_getter rng : Random = Random.new

  def self.seed(number)
    @@rng = Random.new number
  end

  def self.numerify(number_string)
    number_string = number_string.as String
    number_string.sub(/#/) { (@@rng.rand(9) + 1).to_s }.gsub(/#/) { @@rng.rand(10).to_s }
  end

  def self.letterify(letter_string)
    letter_string.gsub(/\?/) { ("A".."Z").to_a.sample(@@rng) }
  end

  def self.bothify(string)
    self.letterify(self.numerify(string))
  end

  def self.regexify(re)
    re = re.source if re.is_a?(Regex)
    re.gsub(/^\/?\^?/, "").gsub(/\$?\/?$/, "")                                                                                                                 # Ditch the anchors
      .gsub(/\{(\d+)\}/) { "{#{$1},#{$1}}" }.gsub(/\?/, "{0,1}")                                                                                               # All {2} become {2,2} and ? become {0,1}
      .gsub(/(\[[^\]]+\])\{(\d+),(\d+)\}/) { |match| $1 * (Range.new($2.to_i, $3.to_i)).to_a.sample(@@rng) }                                                   # [12]{1,2} becomes [12] or [12][12]
      .gsub(/(\([^\)]+\))\{(\d+),(\d+)\}/) { |match| $1 * ($2.to_i..$3.to_i).to_a.sample(@@rng) }                                                              # (12|34){1,2} becomes (12|34) or (12|34)(12|34)
      .gsub(/(\\?.)\{(\d+),(\d+)\}/) { |match| $1 * ($2.to_i..$3.to_i).to_a.sample(@@rng) }                                                                    # A{1,2} becomes A or AA or \d{3} becomes \d\d\d
      .gsub(/\((.*?)\)/) { |match| match.gsub(/[\(\)]/, "").split("|").sample(@@rng) }                                                                         # (this|that) becomes "this" or "that"
      .gsub(/\[([^\]]+)\]/) { |match| match.gsub(/(\w\-\w)/) { |range| ((0...range.size).map { |i| range[i].to_s }).join("").split("-").to_a.sample(@@rng) } } # All A-Z inside of [] become C (or X, or whatever)
      .gsub(/\[([^\]]+)\]/) { |match| $1.split("").sample(@@rng) }                                                                                             # All [ABC] become B (or A or C)
      .gsub("\\d") { |match| (0..9).to_a.sample(@@rng) }
      .gsub("\\w") { |match| (("A".."Z").to_a + (0..9).to_a).sample(@@rng) }
  end

  def self.fetch(data)
    data = data.as Array
    fetched = data.sample(@@rng).as String
    if fetched.match(/^\//) && fetched.match(/\/$/) # A regex
      fetched = Faker.regexify(fetched)
    end

    Faker.parse(fetched).as String
  end

  def self.parse(st)
    st.gsub(/%\{([^\}]+)\}/) do |str, matches|
      find_fn([
        Address.building_number,
        Address.city_prefix,
        Address.city_suffix,
        Address.state,
        Address.street_name,
        Address.street_suffix,
        Company.name,
        Company.suffix,
        Name.first_name,
        Name.last_name,
        Name.name,
        Name.prefix,
        Name.suffix,
        Team.creature,
      ], $1)
    end
  end

  macro find_fn(list, fn)
    case {{fn}}
      {% for l in list %}
        when "{{l}}"
          {{l}}
      {% end %}
    else
      "Hoaydaaa"
    end
  end

  # Generates a random value between the interval
  def self.rand_in_range(from, to)
    from, to = to, from if to < from
    @@rng.rand(from..to)
  end
end
