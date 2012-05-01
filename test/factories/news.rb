# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news do
    author { FactoryGirl.build(:user) }
    title Forgery(:lorem_ipsum).words(3)
    subtitle Forgery(:lorem_ipsum).words(5)
    content Forgery(:lorem_ipsum).words(300)
    tags []
    frozen false
    disabled false
  end
end
