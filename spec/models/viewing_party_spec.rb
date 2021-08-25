require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'associations' do
    it { should have_many(:guests).with_foreign_key('party_id') }
    it { should belong_to(:user).with_foreign_key('organizer_id') }
  end
end
