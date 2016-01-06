module Faker
  class Commerce
    def self.color
      Faker.fetch(Data["commerce"]["color"])
    end

    def self.department
      Faker.fetch(Data["commerce"]["department"])
    end

    def self.product_name
      product_name = Data["commerce"]["product_name"] as Hash
      Faker.fetch(product_name["adjective"]) + " " + Faker.fetch(product_name["material"]) + " " + Faker.fetch(product_name["product"])
    end
  end
end
