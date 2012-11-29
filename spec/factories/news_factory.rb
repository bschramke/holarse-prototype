require 'factory_girl'

FactoryGirl.define do
  factory :news do
    title Forgery::LoremIpsum.words(3) 
    subtitle Forgery::LoremIpsum.words(5)
    content Forgery::LoremIpsum.sentences(30)
  end
end
