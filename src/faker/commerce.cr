module Faker
  class Commerce
    def self.color
      Faker.fetch(Data["color"]["name"])
    end

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

    def self.material
      product_name = Data["commerce"]["product_name"].as Hash
      Faker.fetch(product_name["material"])
    end

    def self.product_name
      product_name = Data["commerce"]["product_name"].as Hash
      Faker.fetch(product_name["adjective"]) + " " + Faker.fetch(product_name["material"]) + " " + Faker.fetch(product_name["product"])
    end

    def self.price(range = 0.0..100.0)
      (Faker.rng.rand(range) * 100).floor/100.0
    end

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
