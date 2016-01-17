require "./spec_helper"

describe Faker do
  it "numerify" do
    100.times do
      Faker.numerify("###").match(/[1-9]\d{2}/).should_not eq nil
    end
  end

  it "letterify" do
    Faker.letterify("???").match(/[A-Z]{3}/).should_not eq nil
  end

  it "regexify" do
    {
      "uk post code" => /^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$/,
      "us phone"     => /^(1-?)[2-8][0-1][0-9]-\d{3}-\d{4}$/,
    }.each do |label, re|
      10.times do
        Faker.regexify(re).match(re).should_not eq nil
      end
    end
  end
end
