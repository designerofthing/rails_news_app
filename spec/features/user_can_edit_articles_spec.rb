require 'rails_helper'

feature 'User can edit articles' do
    before do
        visit root_path
        click_on "New Article"
    end

    context 'Successfully edit an article [Happy Path]' do
        before do
          fill_in "Title", with: "Happy holidays"
          fill_in "Content", with: "Buy your gifts now!"
          click_on "Create Article"
        end
            
        
    end
end