require 'rails_helper'
RSpec.describe "Movie" do
  before(:each) do
    user = User.create(email: 'hello@example.com', password: '1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit movies_path
  end

  describe 'Page', :vcr do
    it 'has button to find top rated movies' do
      expect(page).to have_button('Find Top Rated Movies')
    end

    it 'has form for search by title', :vcr do
      expect(page).to have_button('Find Top Rated Movies')
      expect(page).to have_field('filter')
    end
  end

  describe "Page after user clicks 'Find Top Rate Movies' button", :vcr do
    it 'should return list of top rated movies with vote average' do
      click_on 'Find Top Rated Movies'

      expect(page).to have_content("Dilwale Dulhania Le Jayenge")
      expect(page).to have_content('8.8')
      expect(page).to have_content("Clouds")
      expect(page).to have_content('8.4')
      expect(current_path).to eq(movies_path)
    end
  end

  describe 'Page after user enters movie search param', :vcr do
    it 'should return movies with search param in title' do
      fill_in :filter, with: 'Phoenix'
      click_on 'Find Movies'

      expect(page).to have_content("Dark Phoenix")
      expect(page).to have_content('6')
      expect(page).to have_content("Flight of the Phoenix")
      expect(page).to have_content('6')
      expect(current_path).to eq(movies_path)
    end
  end
end
