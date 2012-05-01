# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :crossover do
    versions ["1.0", "2.0", "3.0"]
    url "http://www.example.com"
    maxrating "Gold"
  end
end
