# Read about factories at https://github.com/thoughtbot/factory_girl
require 'digest'

FactoryGirl.define do
  factory :user do |f|
    f.username Forgery(:internet).user_name
    f.email Forgery(:internet).email_address
    f.password "test123"
    f.created_at Time.now
    f.updated_at Time.now
    f.active true
    f.old_password_hash Digest::MD5.hexdigest("test123old")
    f.signature Forgery(:lorem_ipsum).words(3)
    f.sequence(:jabber) { |n| "user#{n}@jabber.org" }
    f.city Forgery(:name).location
    f.computer "IBM PS/2 mit 16MB RAM"
    f.distro "OpenSUSE"
    f.minecraft true
    f.minecraft_username Forgery(:internet).user_name
    f.desura Forgery(:internet).user_name
    f.avatar File.new(Rails.root + 'test/fixtures/images/rails.png')
    f.favourite_games [Forgery(:name).title, Forgery(:name).title, Forgery(:name).title]
    f.roles [Forgery(:name).title]
  end
end
