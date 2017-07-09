require "./spec_helper"

describe Faker::Address do
  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Address.city.should eq "North Mercedesmouth"
    Faker::Address.street_name.should eq "Thalia Tunnel"
    Faker::Address.street_address.should eq "33421 Kunde Mills"
    Faker::Address.secondary_address.should eq "Apt. 475"
    Faker::Address.building_number.should eq "4103"
    Faker::Address.zip_code.should eq "32555"
    Faker::Address.postcode.should eq "GX44 3IC"
    Faker::Address.time_zone.should eq "Asia/Rangoon"
    Faker::Address.street_suffix.should eq "Springs"
    Faker::Address.city_suffix.should eq "town"
    Faker::Address.city_prefix.should eq "North"
    Faker::Address.state.should eq "Missouri"
    Faker::Address.state_abbr.should eq "TN"
    Faker::Address.country.should eq "Svalbard & Jan Mayen Islands"
    Faker::Address.country_code.should eq "IS"
    Faker::Address.latitude.should eq "15.393888556377334"
    Faker::Address.longitude.should eq "-77.86301819889268"
  end
end
