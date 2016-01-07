module Faker
  class Avatar
    def self.image(slug = nil)
      slug ||= Faker::Lorem.word
      "http://robohash.org/#{slug}"
    end
  end
end
