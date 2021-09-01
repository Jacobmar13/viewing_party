require 'rails_helper'

RSpec.describe Guest do
  describe 'associations' do
    it { should belong_to(:viewing_party).with_foreign_key('party_id') }
    it { should belong_to(:user).with_foreign_key('guest_id') }
  end

  describe 'methods' do
    describe '::find_party' do
      it 'returns parties user is a guest of' do
        user1 = User.create(email: 'hello@example.com', password: '1234')
        user2 = User.create(email: 'goodbye@example.com', password: 'abcd')
        user3 = User.create(email: 'thankyou@example.com', password: '4321')

        friend1 = Friend.create(user_id: user1.id, friend_id: user2.id)
        friend2 = Friend.create(user_id: user1.id, friend_id: user3.id)

        params1 = {organizer_id: user1.id, duration: 140, date: '2021-09-08', start_time: '15:23:00', movie_id: 630566}
        
        party1 = ViewingParty.create!(params1)

        guest1 = Guest.create!(guest_id: user2.id, party_id: party1.id)

        expect(guest1.find_party).to eq(party1)
      end
    end
  end
end
