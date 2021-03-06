# frozen_string_literal: true

require 'rails_helper'

feature 'user can sign up (happy path)' do
  before do
    visit root_path
    click_on 'Sign Up'
  end

  it 'user should be on the sign up page' do
      expect(page).to have_content 'Sign up'
  end

  it 'user can input email and password to sign up' do
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end

feature 'user can sign up (sad path)' do
  before do
    visit root_path
    click_on 'Sign Up'
  end

  it 'user fails to input password twice correctly' do
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123457'
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end

  it 'user fails to input email correctly' do
    fill_in 'Email', with: 'testgmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end
end