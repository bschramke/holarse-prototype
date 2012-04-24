# Read about factories at https://github.com/thoughtbot/factory_girl
require 'digest'

FactoryGirl.define do
  factory :user do
    username Forgery(:internet).user_name
    email Forgery(:internet).email_address
    password "test123"
    created_at Time.now
    updated_at Time.now
    active true
    old_password_hash Digest::MD5.hexdigest("test123old")
    signature Forgery(:lorem_ipsum).words(3)
    sequence(:jabber) { |n| "user#{n}@jabber.org" }
    city Forgery(:name).location
    computer Forgery(:lorem_ipsum).words(3)
    distro "OpenSUSE"
    minecraft true
    minecraft_username Forgery(:internet).user_name
    desura Forgery(:internet).user_name
    avatar File.new(Rails.root + 'test/fixtures/images/rails.png')
    favourite_games [Forgery(:lorem_ipsum).word, Forgery(:lorem_ipsum).word, Forgery(:lorem_ipsum).word]

    factory :admin do
      roles ["admin"]
    end
  end
end
