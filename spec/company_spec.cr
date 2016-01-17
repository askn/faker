require "./spec_helper"
require "http/client"

describe Faker::Company do
  it "logo" do
    Faker::Company.logo.match(%r{https://pigment.github.io/fake-logos/logos/medium/color/\d+\.png}).should_not eq nil
  end
end
