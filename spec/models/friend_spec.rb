require 'rails_helper'

RSpec.describe Friend do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:each_friend) }
  end

  describe 'methods' do
    describe '::friend_email' do
      it 'finds user email with friend_id' do
        user1 = User.create(email: 'hello@example.com', password: '1234')
        user2 = User.create(email: 'goodbye@example.com', password: 'abcd')
        user3 = User.create(email: 'thankyou@example.com', password: '4321')

        friend1 = Friend.create(user_id: user1.id, friend_id: user2.id)
        friend2 = Friend.create(user_id: user1.id, friend_id: user3.id)

        expect(friend1.friend_email).to eq(user2.email)
        expect(friend2.friend_email).to eq(user3.email)
      end
    end
  end
end
