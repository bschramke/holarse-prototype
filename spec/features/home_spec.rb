require 'spec_helper'

describe 'home page' do
    it 'should show the welcome page' do
        visit '/'
        page.should have_content('HelloWorld')
    end
end
