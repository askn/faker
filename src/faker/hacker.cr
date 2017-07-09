# Port of http://shinytoylabs.com/jargon/
module Faker
  class Hacker
    def self.say_something_smart
      phrases.sample(Faker.rng)
    end

    {% for data_type in %w(abbreviation adjective noun verb ingverb) %}
      def self.{{data_type.id}}
        Faker.fetch(Data["hacker"]["{{data_type.id}}"])
      end
    {% end %}

    def self.phrases
      ["If we #{verb} the #{noun}, we can get to the #{abbreviation} #{noun} through the #{adjective} #{abbreviation} #{noun}!",
       "We need to #{verb} the #{adjective} #{abbreviation} #{noun}!",
       "Try to #{verb} the #{abbreviation} #{noun}, maybe it will #{verb} the #{adjective} #{noun}!",
       "You can't #{verb} the #{noun} without #{ingverb} the #{adjective} #{abbreviation} #{noun}!",
       "Use the #{adjective} #{abbreviation} #{noun}, then you can #{verb} the #{adjective} #{noun}!",
       "The #{abbreviation} #{noun} is down, #{verb} the #{adjective} #{noun} so we can #{verb} the #{abbreviation} #{noun}!",
       "#{ingverb} the #{noun} won't do anything, we need to #{verb} the #{adjective} #{abbreviation} #{noun}!",
       "I'll #{verb} the #{adjective} #{abbreviation} #{noun}, that should #{noun} the #{abbreviation} #{noun}!",
      ]
    end
  end
end
