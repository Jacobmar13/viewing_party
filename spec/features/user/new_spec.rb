require 'rails_helper'
RSpec.describe 'new user registration' do
  describe 'viewable elements' do
    it 'exists' do
      visit new_user_path

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content('Email:')
      expect(page).to have_content('Password:')
      expect(page).to have_content('Password Confirmation:')
      expect(page).to have_button('Register')
    end
  end

  describe 'interactive elements' do
    it 'can be used' do

      visit new_user_path
# save_and_open_page
      fill_in 'user[email]', with: 'hello@example.com'
      fill_in 'user[password]', with: '1234'
      fill_in 'user[password_confirmation]', with: '1234'

      click_on 'Register'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Registration successful. Please log in!')
    end

    it 'can test sad path for non matching passwords' do
      visit new_user_path
      # save_and_open_page
      fill_in 'user[email]', with: 'hello@example.com'
      fill_in 'user[password]', with: '1234'
      fill_in 'user[password_confirmation]', with: 'abcd'

      click_on 'Register'

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content('Passwords do not match!')
    end
  end
end
