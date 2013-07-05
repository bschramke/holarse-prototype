require "faker"

Fabricator(:role) do
  name { Faker::Lorem.word }
end
