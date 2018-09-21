require "./spec_helper"

describe Faker::Commerce do
  it "color" do
    Faker::Commerce.color.match(/[a-z]+\.?/).should_not eq nil
  end

  it "department" do
    Faker::Commerce.department.match(/[A-Z][a-z]+\.?/).should_not eq nil
  end

  it "single_department_should_not_contain_separators" do
    Faker::Commerce.department(1).match(/\A[A-Za-z]+\z/).should_not eq nil
  end

  it "department_should_have_ampersand_as_default_separator" do
    Faker::Commerce.department(2, true).scan(" & ").should_not eq nil
  end

  it "department_should_have_exact_number_of_categories_when_fixed_amount" do
    Faker::Commerce.department(10, true).match(/\A([A-Za-z]+, ){8}[A-Za-z]+ & [A-Za-z]+\z/).should_not eq nil
  end

  it "department_should_never_exceed_the_max_number_of_categories_when_random_amount" do
    100.times do
      Faker::Commerce.department(6).match(/\A([A-Za-z]+(, | & )){0,5}[A-Za-z]+\z/).should_not eq nil
    end
  end

  it "department_should_have_no_duplicate_categories" do
    department = Faker::Commerce.department(10, true)

    departments = department.split(/[,& ]+/)
    departments.should eq departments.uniq
  end

  it "product_name" do
    Faker::Commerce.product_name.match(/[A-Z][a-z]+\.?/).should_not eq nil
  end

  it "material" do
    Faker::Commerce.material.match(/[A-Z][a-z]+\.?/).should_not eq nil
  end

  it "price" do
    (0 <= Faker::Commerce.price <= 100).should be_true
    (5 <= Faker::Commerce.price(5..6) <= 6).should be_true
    (990 <= Faker::Commerce.price(990...1000) <= 1000).should be_true
    Faker::Commerce.price(5..6).is_a?(Float).should be_true
  end

  it "price_is_float" do
    Faker::Commerce.price.is_a?(Float).should be_true
  end

  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Commerce.color.should eq "fuchsia"
    Faker::Commerce.department.should eq "Garden & Tools"
    Faker::Commerce.department(5).should eq "Kids, Health, Tools & Music"
    Faker::Commerce.department(2, true).should eq "Garden & Industrial"
    Faker::Commerce.product_name.should eq "Durable Aluminum Bag"
    Faker::Commerce.price.should eq 62.86
    Faker::Commerce.material.should eq "Leather"
  end
end
