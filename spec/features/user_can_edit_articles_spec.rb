require 'rails_helper'

feature 'User can edit articles' do
    before do
      visit root_path
    end

    context 'Successfully edit an article [Happy Path]' do
        before do
          click_on 'Happy holidays'
          click_on 'Edit Article'
          fill_in "Title", with: "Not so Happy holidays"
          fill_in "Content", with: "Don't Buy your gifts now it's a con!"
          click_on "Save Changes"
        end
        
        it 'User should be on article show page' do
            article = Article.find_by(title: 'Not so Happy holidays')
            expect(current_path).to eq article_path(article)
          end
  
          it 'User should see success message' do
              expect(page).to have_content 'Article was successfully saved.'
          end
  
          it 'User should see article title' do
            expect(page).to have_content 'Not so Happy holidays'
          end
  
          it 'User should see article content' do
            expect(page).to have_content "Don't Buy your gifts now it's a con!"
          end
        end
    end    
    
    context "User edits title away for the article [Sad Path]" do
        before do
          fill_in "Title", with: ""
          click_on "Save Article"
        end
  
        it 'User should see error message' do
          expect(page).to have_content 'Whoops, something went wrong'
        end
    end
      
    context "User edits content away for the article [Sad Path]" do
        before do
          fill_in "Content", with: ""
          click_on "Save Article"
        end
  
        it 'User should see error message' do
          expect(page).to have_content 'Whoops, something went wrong'
        end
    end        

