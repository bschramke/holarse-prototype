require 'faker'

Fabricator(:user) do
  username { Faker::Internet.user_name }
  email { Faker::Internet.email } 
  password { |attrs| "#{attrs[:username]}" }
  password_confirmation { |attrs| "#{attrs[:username]}" }
end

Fabricator(:admin_user, from: :user) do
  roles { Role.where(name: :admin) }
end
