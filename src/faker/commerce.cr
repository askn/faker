module Faker
  class Commerce < Base
    def self.color
      Faker.fetch(Data["color"]["name"])
    end

    uniquify_builder(color)

    def self.department(max = 3, fixed_amount = false)
      num = max if fixed_amount
      num ||= 1 + Faker.rng.rand(max)

      categories = categories(num)

      if num > 1
        merge_categories(categories)
      else
        categories[0]
      end
    end

    # TODO: uniquify_builder(department)

    def self.material
      product_name = Data["commerce"]["product_name"].as Hash
      Faker.fetch(product_name["material"])
    end

    uniquify_builder(material)

    def self.product_name
      product_name = Data["commerce"]["product_name"].as Hash
      Faker.fetch(product_name["adjective"]) + " " + Faker.fetch(product_name["material"]) + " " + Faker.fetch(product_name["product"])
    end

    uniquify_builder(product_name)

    def self.price(range = 0.0..100.0)
      (Faker.rng.rand(range) * 100).floor/100.0
    end

    # TODO: uniquify_builder(price)

    private def self.categories(num)
      categories = [] of String
      while categories.size < num
        category = Faker.fetch(Data["commerce"]["department"])
        categories << category unless categories.includes?(category)
      end
      categories
    end

    private def self.merge_categories(categories)
      separator = " & "
      comma_separated = categories[0...-1].join(", ")
      [comma_separated, categories[-1]].join(separator)
    end
  end
end
