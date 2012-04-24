# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :onlineshop do
    name Forgery(:name).industry
    url "http://www.example.com"
  end
end
