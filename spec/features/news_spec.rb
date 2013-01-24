require 'spec_helper'

describe 'news pages' do
    it 'should show the news overview page' do
        visit '/news'
        page.should have_content('News')
    end

    it 'should be able to edit a news' do
        user = FactoryGirl.create(:user)
        news = FactoryGirl.create(:news, :user => user)
        visit edit_news_path(news)
    end
end
