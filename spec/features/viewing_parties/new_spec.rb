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

  describe 'Page form', :vcr do
    it 'has viewable elements' do
      visit movie_path(630566)

      click_button 'Create Viewing Party for Movie'

      expect(current_path).to eq(viewing_party_new_path)
      expect(page).to have_content('Movie Title')
      expect(page).to have_content('Duration of Party')
      expect(page).to have_content('Day')
      expect(page).to have_content('Start Time')
      expect(page).to have_button('Create Party')
    end

    describe 'when filled' do
      it 'can create party and go to dashboard on happy path' do
        visit movie_path(630566)

        click_button 'Create Viewing Party for Movie'

        fill_in :duration, with: 140
        fill_in :date, with: '2021-09-08'
        fill_in :start_time, with: '15:23:00'
        check 'goodbye@example.com'
        check 'thankyou@example.com'
        click_on 'Create Party'

        expect(current_path).to eq(user_path(@user.id))
      end

      it 'can be redirected to form for too small duration on sad path' do
        visit movie_path(630566)

        click_button 'Create Viewing Party for Movie'

        fill_in :duration, with: 100
        fill_in :date, with: '2021-09-08'
        fill_in :start_time, with: '15:23:00'
        check 'goodbye@example.com'
        check 'thankyou@example.com'
        click_on 'Create Party'

        expect(current_path).to eq(viewing_party_new_path)
      end

      it 'can be redirected to form for blank entries on sad path' do
        visit movie_path(630566)

        click_button 'Create Viewing Party for Movie'

        fill_in :duration, with: 140
        fill_in :start_time, with: '15:23:00'
        check 'goodbye@example.com'
        check 'thankyou@example.com'
        click_on 'Create Party'

        expect(current_path).to eq(viewing_party_new_path)
      end
    end
  end
end
