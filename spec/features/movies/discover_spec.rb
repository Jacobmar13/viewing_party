require 'rails_helper'
RSpec.describe 'Discover Page' do
  describe 'instantiation' do
    it 'can show button and form' do
      user = User.create(email: 'hello@example.com', password: '1234')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit discover_path

      expect(page).to have_content("Welcome #{user.email}!")
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_field(:filter)
      expect(page).to have_button("Find Movies")
    end
  end
end
