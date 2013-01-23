# Read about factories at https://github.com/thoughtbot/factory_girl

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
    roles [ Role.find_by_name(:admin) ]
  end
end
