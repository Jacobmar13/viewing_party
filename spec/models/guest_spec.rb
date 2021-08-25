require 'rails_helper'

RSpec.describe Guest do
  describe 'associations' do
    it { should belong_to(:viewing_party).with_foreign_key('party_id') }
    it { should belong_to(:user).with_foreign_key('guest_id') }
  end
end
