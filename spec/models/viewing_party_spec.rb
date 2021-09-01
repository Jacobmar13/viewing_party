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
end
