# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    author { FactoryGirl.build(:user) }
    title Forgery(:lorem_ipsum).words(3)
    content Forgery(:lorem_ipsum).words(300)
    alternatives [Forgery(:lorem_ipsum).words(3), Forgery(:lorem_ipsum).words(2)]
    tags [Forgery(:lorem_ipsum).word, Forgery(:lorem_ipsum).word]
    reviseme false
    releasedate Forgery(:date).date
    ftp false
    nouploads false
    redirection nil
    onlineshops { [FactoryGirl.build(:onlineshop)]}
  end
end
