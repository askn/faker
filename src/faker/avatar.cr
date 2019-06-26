module Faker
  class Avatar < Base
    def self.image(slug = nil)
      slug ||= Faker::Lorem.word
      "http://robohash.org/#{slug}"
    end

    uniquify_builder(image, slug = nil)
  end
end
