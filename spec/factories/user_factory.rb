require 'factory_girl'

FactoryGirl.define do
  factory :user do
    username { Forgery::Internet.user_name }
    password { "#{username}" }
    email { Forgery::Internet.email_address }
    city  { Forgery::Address.city }
    birthday { Forgery::Date.date(:past => true) }
    jabber { "#{username}@holarse-linuxgaming.de" }
    avatar { File.open Rails.root.join('test','fixtures','images',"avatar#{rand(9)+1}.png") }
  end

  factory :admin, :parent => :user do
    roles { ["admin"] }
  end

end
