require 'rails_helper'
RSpec.describe 'user show page' do
  describe 'not authenticated user' do
    it 'can see 400 error when not logged in' do
      visit user_path(1)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

  describe 'as authenticated user' do
    it 'can have a dashboard page' do
      user = User.create(email: 'hello@example.com', password: '1234')

      visit root_path
      fill_in 'email', with: 'hello@example.com'
      fill_in 'password', with: '1234'
      click_on 'Sign In'

      expect(page).to have_content("Welcome #{user.email}!")
    end
  end

  describe 'as authenticated user cannot visit another users show page' do
    it 'cannot access another users show page' do
      user = User.create(email: 'hello@example.com', password: '1234')
      user_2 = User.create(email: 'goodbye@example.com', password: 'abcd')

      visit root_path
      fill_in 'email', with: 'hello@example.com'
      fill_in 'password', with: '1234'
      click_on 'Sign In'

      expect(current_path).to eq(user_path(user.id))

      visit user_path(user_2.id)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

  describe 'has friends section' do
    it 'displays string when user has no friends' do
      user = User.create(email: 'hello@example.com', password: '1234')

      visit root_path
      fill_in 'email', with: 'hello@example.com'
      fill_in 'password', with: '1234'
      click_on 'Sign In'

      expect(page).to have_content("You currently have no friends")
    end

    it "displays friend's emails if friends are added" do
      user = User.create(email: 'hello@example.com', password: '1234')
      user_2 = User.create(email: 'goodbye@example.com', password: 'abcd')
      user_3 = User.create(email: 'thankyou@example.com', password: '4321')

      Friend.create(user_id: user.id, friend_id: user_2.id)
      Friend.create(user_id: user.id, friend_id: user_3.id)

      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      fill_in 'email', with: 'hello@example.com'
      fill_in 'password', with: '1234'
      click_on 'Sign In'

      expect(page).to have_content(user_2.email)
      expect(page).to have_content(user_3.email)
    end

    it 'can add friends by form' do
      user = User.create(email: 'hello@example.com', password: '1234')
      user_2 = User.create(email: 'goodbye@example.com', password: 'abcd')
      user_3 = User.create(email: 'thankyou@example.com', password: '4321')

      visit root_path
      fill_in 'email', with: 'hello@example.com'
      fill_in 'password', with: '1234'
      click_on 'Sign In'

      fill_in :email, with: user_2.email
      click_on 'Add Friend'

      expect(page).to have_content(user_2.email)
    end
  end
end
