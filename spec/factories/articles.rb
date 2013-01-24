# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title { Forgery::LoremIpsum.words(3) }
    content { Forgery::LoremIpsum.sentences(30) }
  end
end
