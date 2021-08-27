require 'rails_helper'

RSpec.describe Friend do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:each_friend) }
  end
end
