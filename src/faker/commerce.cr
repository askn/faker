module Faker
  class Commerce
    def self.color
      Faker.fetch(Data["color"]["name"])
    end

    def self.department
      Faker.fetch(Data["commerce"]["department"])
    end

    def self.product_name
      product_name = Data["commerce"]["product_name"] as Hash
      Faker.fetch(product_name["adjective"]) + " " + Faker.fetch(product_name["material"]) + " " + Faker.fetch(product_name["product"])
    end

    def self.price
      (rand(100) + rand).round(2)
    end
  end
end
