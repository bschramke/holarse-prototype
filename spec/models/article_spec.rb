require 'spec_helper'

describe Article do
    it "should require an title" do
        article = FactoryGirl.build(:article, :title => nil, :user => User.first)
        expect(article.save).to be(false)
    end
end
