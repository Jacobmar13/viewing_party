require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:friends) }
    it { should have_many(:each_friend).through(:friends) }
    it { should have_many(:viewing_parties).with_foreign_key('organizer_id') }
    it { should have_many(:guests).with_foreign_key('guest_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email)}
    it { should validate_presence_of(:password)}
  end

  describe 'methods' do
    describe '::friend_info' do
      it 'returns user models from associated friends' do
        user = User.create(email: 'hello@example.com', password: '1234')
        user_2 = User.create(email: 'goodbye@example.com', password: 'abcd')
        user_3 = User.create(email: 'thankyou@example.com', password: '4321')

        Friend.create(user_id: user.id, friend_id: user_2.id)
        Friend.create(user_id: user.id, friend_id: user_3.id)

        expect(user.friend_info).to eq([user_2, user_3])
      end
    end
  end
end
