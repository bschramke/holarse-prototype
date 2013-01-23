# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    content { Forgery::LoremIpsum.sentences(30) }
  end
end
