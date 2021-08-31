require 'rails_helper'
RSpec.describe 'Movie details page' do
  describe 'instantiation', :vcr do
    it 'can display details about movie' do
      user = User.create(email: 'hello@example.com', password: '1234')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit movie_path(320288)
      
      expect(current_path).to eq(movie_path(320288))
      expect(page).to have_content("Vote Average:")
      expect(page).to have_content("Runtime:")
      expect(page).to have_content("Genre(s):")
      expect(page).to have_content("Summary:")
      expect(page).to have_content("Cast:")
      expect(page).to have_content("Reviews:")
    end
  end
end
