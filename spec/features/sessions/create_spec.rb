require 'rails_helper'
RSpec.describe 'Create user session' do
  it 'can create new session on login' do
    user = User.create(email: 'hello@example.com', password: '1234')

    visit root_path
    
    fill_in 'email', with: 'hello@example.com'
    fill_in 'password', with: '1234'

    click_on 'Sign In'
save_and_open_page
    expect(current_path).to eq(user_path(user.id))
  end
end
