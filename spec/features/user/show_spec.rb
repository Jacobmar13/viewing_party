require 'rails_helper'
RSpec.describe 'user show page' do
  describe 'not authenticated user' do
    it 'can see 400 error when not logged in' do
      visit user_path(1)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

  describe 'as authenticated user' do
    it 'can have a dashboard page' do
        user = User.create(email: 'hello@example.com', password: '1234')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit user_path(user.id)
        
        expect(page).to have_content("Welcome #{user.email}!")
    end
  end
end
