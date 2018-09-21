require "./spec_helper"

describe Faker::Hacker do
  it { (Faker::Hacker.phrases.size == 8).should be_true }

  it "phrases" do
    Faker::Hacker.phrases.each do |phrase|
      phrase.nil?.should be_false
      (phrase == "").should be_false
    end
  end

  it "noun" do
    Faker::Hacker.noun.match(/\w+/).should_not eq nil
  end

  it "abbreviation" do
    Faker::Hacker.abbreviation.match(/\w+/).should_not eq nil
  end

  it "adjective" do
    Faker::Hacker.adjective.match(/\w+/).should_not eq nil
  end

  it "verb" do
    Faker::Hacker.verb.match(/\w+/).should_not eq nil
  end

  it "ingverb" do
    Faker::Hacker.ingverb.match(/\w+/).should_not eq nil
  end

  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Hacker.say_something_smart.should eq "backing up the transmitter won't do anything, we need to bypass the  optical RSS firewall!"
    Faker::Hacker.abbreviation.should eq "USB"
    Faker::Hacker.adjective.should eq "virtual"
    Faker::Hacker.noun.should eq "port"
    Faker::Hacker.verb.should eq "transmit"
    Faker::Hacker.ingverb.should eq "calculating"
  end
end
