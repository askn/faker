require "./spec_helper"

describe Faker::Address do
  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Address.city.should eq "Kemmerland"
    Faker::Address.street_name.should eq "Boyer Views"
    Faker::Address.street_address.should eq "82059 Batz Passage"
    Faker::Address.secondary_address.should eq "Apt. 856"
    Faker::Address.building_number.should eq "22820"
    Faker::Address.zip_code.should eq "89366"
    Faker::Address.postcode.should eq "JA95 9QF"
    Faker::Address.time_zone.should eq "Pacific/Honolulu"
    Faker::Address.street_suffix.should eq "Loop"
    Faker::Address.city_suffix.should eq "mouth"
    Faker::Address.city_prefix.should eq "Lake"
    Faker::Address.state.should eq "Montana"
    Faker::Address.state_abbr.should eq "VA"
    Faker::Address.country.should eq "Swaziland"
    Faker::Address.country_code.should eq "MK"
    Faker::Address.latitude.should eq "-23.850993082533705"
    Faker::Address.longitude.should eq "-4.488135572134695"
  end
end
