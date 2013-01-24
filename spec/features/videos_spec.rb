require 'spec_helper'

describe 'videos page' do
    it 'should show the youtube-videos page' do
        visit '/videos'
        page.should have_content('Videos')
    end
end
