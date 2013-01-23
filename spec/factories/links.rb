# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    url { "http://#{Forgery::Internet.domain_name}.#{Forgery::Internet.top_level_domain}" }
    description "MyString"
  end
end
