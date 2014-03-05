require "faker"

Fabricator(:inbox) do
  sender { Faker::Name.name }
  info { Faker::Lorem.paragraphs(3).join " " }
  url { Faker::Internet.url }
end
