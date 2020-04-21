require 'rails_helper'

feature 'User can create articles' do
    before do
        visit root_path
        click_on "New Article"
    end
end