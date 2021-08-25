require 'rails_helper'

RSpec.describe Friend do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:user).with_foreign_key('friend_id') }
  end
end
