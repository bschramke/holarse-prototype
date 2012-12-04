require 'factory_girl'

FactoryGirl.define do
  factory :link do
    description { Forgery::LoremIpsum.words(3) }
    url { Forgery::Internet.domain_name  }
  end
end
