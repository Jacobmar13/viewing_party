require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:friends)}
    it { should have_many(:friends).with_foreign_key('friend_id')}
    it { should have_many(:viewing_parties).with_foreign_key('organizer_id') }
    it { should have_many(:guests).with_foreign_key('guest_id')}
  end

  describe 'validations' do
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email)}
    it { should validate_presence_of(:password)}
  end
end
