# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    url { http://#{Forgery::Internet.domain_name}" }
    description "MyString"
  end
end
