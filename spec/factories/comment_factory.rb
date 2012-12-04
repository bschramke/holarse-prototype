require 'factory_girl'

FactoryGirl.define do
  factory :comment do
    author nil
    content { Forgery::LoremIpsum.sentences(5) }
    released true
  end
end
