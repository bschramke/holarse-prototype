require 'factory_girl'

FactoryGirl.define do
  factory :user do
    username Forgery::Internet.user_name
    password { "#{username}" }
    email Forgery::Internet.email_address
    city  Forgery::Address.city
  end
end
