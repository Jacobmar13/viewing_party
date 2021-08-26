require 'rails_helper'
RSpec.describe "Welcome page" do
  it 'displays the welcome information' do
    @user = User.create(email: 'hello@example.com', password_digest: '1234')
    visit root_path
    
    fill_in :email, with: 'hello@example.com'
    fill_in :password, with: '1234'
    click_button "Sign In"

    expect(page).to have_content("Welcome to Viewing Party")
    expect(page).to have_content("App For Scheduling Viewing Parties")
    expect(page).to have_content("Email: ")
    expect(page).to have_content("Password:")
    expect(page).to have_button("Sign In")
    expect(page).to have_link("New Here? Register Here")
  end
end
