require 'faker'

Fabricator(:article) do
  title { Faker::Lorem.words(3) }
  content { Faker::Lorem.paragraphs(3) }
  enabled { true }  
end
