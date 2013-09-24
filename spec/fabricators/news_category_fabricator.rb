Fabricator(:news_category) do
  code { Faker::Company.name }
  description { Faker::Company.catch_phrase }
end
