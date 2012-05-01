# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wine do
    versions ["1.0", "1.1", "1.2"]
    url "http://www.winqhq.com"
    maxrating "Gold"    
  end
end
