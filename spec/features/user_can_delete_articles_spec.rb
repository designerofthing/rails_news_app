# frozen_string_literal: true

require 'rails_helper'

feature 'user can delete an article' do
  before do
    visit root_path
    delete_input
  end

  context 'Successfully delete an article [Happy Path]' do
    before do
      edit_new
    end

    it 'User should see success message' do
      expect(page).to have_content 'Article was successfully deleted.'
    end

    it 'User should not see article title' do
      expect(page).to have_no_content 'Not so Happy holidays'
    end

    it 'User should not see article content' do
      expect(page).to have_no_content "Don't buy your gifts now it's a con!"
    end
  end
end

def delete_input
  click_on 'New Article'
  fill_in 'Title', with: 'Happy holidays'
  fill_in 'Content', with: 'Buy your gifts now!'
  click_on 'Create Article'
  click_on 'Delete Article'
end
