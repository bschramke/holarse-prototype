# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    name "generic"
  end

  factory :adminrole, :parent => :role do
    name :admin.to_s
  end
end
