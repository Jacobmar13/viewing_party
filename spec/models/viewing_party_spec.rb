require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'associations' do
    it { should have_many(:guests).with_foreign_key('party_id') }
    it { should belong_to(:user).with_foreign_key('organizer_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:duration)}
    it { should validate_presence_of(:start_time)}
    it { should validate_presence_of(:date)}
  end

  describe 'methods', :vcr do
    describe '::movie_title' do
      it 'returns movie title from movie_id' do
        user1 = User.create(email: 'hello@example.com', password: '1234')

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

        params1 = {organizer_id: user1.id, duration: 140, date: '2021-09-08', start_time: '15:23:00', movie_id: 630566}

        party1 = ViewingParty.create!(params1)

        expect(party1.movie_title).to eq('Clouds')
      end
    end
  end
end
