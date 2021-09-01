require 'rails_helper'

RSpec.describe 'Viewing party new' do
  before :each do
    @user = User.create(email: 'hello@example.com', password: '1234')
    @user_2 = User.create(email: 'goodbye@example.com', password: 'abcd')
    @user_3 = User.create(email: 'thankyou@example.com', password: '4321')
    Friend.create(user_id: @user.id, friend_id: @user_2.id)
    Friend.create(user_id: @user.id, friend_id: @user_3.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'Page has a form', :vcr do
    it 'has elements' do
      visit viewing_party_new_path

      expect(page).to have_content('Movie Title')
      expect(page).to have_content('Duration of Party')
      expect(page).to have_content('Day')
      expect(page).to have_content('Start Time')
      expect(page).to have_button('Create Party')
    end
  end

end
