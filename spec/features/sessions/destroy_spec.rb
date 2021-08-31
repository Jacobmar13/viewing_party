require 'rails_helper'
RSpec.describe 'Session destroy' do
  describe 'logout feature' do
    it 'can log out' do
      user = User.create(email: 'hello@example.com', password: '1234')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user.id)

      click_on 'Log Out'

      expect(current_path).to eq(root_path)
    end
  end
end
