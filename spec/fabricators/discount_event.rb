require 'faker'

Fabricator(:discount_event) do
  name { Faker::Company.catch_phrase }
  description { Faker::Lorem.paragraphs }
  website { Faker::Internet.url }
  user
end
