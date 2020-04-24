# frozen_string_literal: true

require 'rails_helper'

feature 'user can sign up' do
  before do
    visit root_path
    click_on 'Sign Up'
  end

  it 'user should be on the sign up page' do
      expect(page).to have_content 'Sign up'
  end
end
