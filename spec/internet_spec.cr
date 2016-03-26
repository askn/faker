require "./spec_helper"

describe Faker::Internet do
  it "email" do
    Faker::Internet.email.match(/.+@.+\.\w+/).should_not eq nil
  end

  it "free_email" do
    Faker::Internet.free_email.match(/.+@(gmail|hotmail|yahoo)\.com/).should_not eq nil
  end

  it "safe_email" do
    Faker::Internet.safe_email.match(/.+@example.(com|net|org)/).should_not eq nil
  end

  it "user_name" do
    Faker::Internet.user_name.match(/[a-z]+((_|\.)[a-z]+)?/).should_not eq nil
  end

  it "user_name_with_string_arg" do
    Faker::Internet.user_name("bo peep").match(/(bo(_|\.)peep|peep(_|\.)bo)/).should_not eq nil
  end

  it "user_name_with_integer_arg" do
    (1..32).to_a.each do |min_length|
      (Faker::Internet.user_name(min_length).size >= min_length).should be_true
    end
  end

  it "user_name_with_closed_range_arg" do
    (1..32).to_a.each do |min_length|
      (min_length..32).each do |max_length|
        l = Faker::Internet.user_name((min_length..max_length)).size
        (l >= min_length).should be_true
        (l <= max_length).should be_true
      end
    end
  end

  it "user_name_with_open_range_arg" do
    (1..32).to_a.each do |min_length|
      (min_length + 1..33).each do |max_length|
        l = Faker::Internet.user_name((min_length...max_length)).size
        (l >= min_length).should be_true
        (l <= max_length - 1).should be_true
      end
    end
  end

  it "user_name_with_range_and_separators" do
    (1..32).to_a.each do |min_length|
      (min_length + 1..33).each do |max_length|
        u = Faker::Internet.user_name((min_length...max_length), %w(=))
        (min_length <= u.size <= max_length - 1).should be_true
        u.match(/\A[a-z]+((=)?[a-z]*)*\z/).should_not eq nil
      end
    end
  end

  it "password" do
    Faker::Internet.password.match(/\w{3}/).should_not eq nil
  end

  it "password_with_integer_arg" do
    # (1..32).to_a.each do |min_length|
    #   assert { Faker::Internet.password(min_length).size >= min_length }
    # end
  end

  it "password_max_with_integer_arg" do
    # (1..32).to_a.each do |min_length|
    #   max_length = min_length + 4
    #   assert { Faker::Internet.password(min_length, max_length).size <= max_length }
    # end
  end

  it "password_with_mixed_case" do
    # Faker::Internet.password.match(/[A-Z]+/).should_not eq nil
  end

  it "password_without_mixed_case" do
    # Faker::Internet.password(8, 12, false).match(/[^A-Z]+/).should_not eq nil
  end

  it "password_with_special_chars" do
    # Faker::Internet.password(8, 12, true, true).match(/[!@#\$%\^&\*]+/).should_not eq nil
  end

  it "password_without_special_chars" do
    # Faker::Internet.password(8, 12, true).match(/[^!@#\$%\^&\*]+/).should_not eq nil
  end

  it "domain_name" do
    Faker::Internet.domain_name.match(/\w+\.\w+/).should_not eq nil
  end

  it "domain_word" do
    Faker::Internet.domain_word.match(/^\w+$/).should_not eq nil
  end

  it "domain_suffix" do
    Faker::Internet.domain_suffix.match(/^\w+(\.\w+)?/).should_not eq nil
  end

  it "ip_v4_address" do
    Faker::Internet.ip_v4_address.count('.').should eq 3

    100.times do
      (Faker::Internet.ip_v4_address.split(".").map { |octet| octet.to_i }.max <= 255).should be_true
    end
  end

  it "public_ip_v4_address" do
    ten_dot = /^10\./
    one_two_seven = /^127\./
    one_six_nine = /^169\.254/
    one_nine_two = /^192\.168\./
    one_seven_two = /^172\.(16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31)\./

    1000.times do
      # address = Faker::Internet.public_ip_v4_address
      # assert_not_match ten_dot, address
      # assert_not_match one_two_seven, address
      # assert_not_match one_six_nine, address
      # assert_not_match one_nine_two, address
      # assert_not_match one_seven_two, address
    end
  end

  it "mac_address" do
    Faker::Internet.mac_address.count(":").should eq 5
    Faker::Internet.mac_address("").count(":").should eq 5

    100.times do
      (Faker::Internet.mac_address.split(":").map { |d| d.to_i(16) }.max <= 255).should be_true
    end

    (Faker::Internet.mac_address("fa:fa:fa").starts_with?("fa:fa:fa")).should be_true
    (Faker::Internet.mac_address("01:02").starts_with?("01:02")).should be_true
  end

  it "ip_v6_address" do
    Faker::Internet.ip_v6_address.count(":").should eq 7

    100.times do
      # assert { Faker::Internet.ip_v6_address.split(".").map { |h| "0x#{h}".to_i }.max <= 65535 }
    end
  end

  it "slug" do
    Faker::Internet.slug.match(/^[a-z]+(_|\.|\-)[a-z]+$/).should_not eq nil
  end

  it "slug_with_content_arg" do
    Faker::Internet.slug("Foo bAr baZ").match(/^foo(_|\.|\-)bar(_|\.|\-)baz$/).should_not eq nil
  end

  it "slug_with_glue_arg" do
    Faker::Internet.slug(nil, "+").match(/^[a-z]+\+[a-z]+$/).should_not eq nil
  end

  it "url" do
    Faker::Internet.url("domain.com", "/username").match(/^http:\/\/domain\.com\/username$/).should_not eq nil
  end

  it "device_token" do
    # Faker::Internet.device_token.size.should eq 64
  end
end
