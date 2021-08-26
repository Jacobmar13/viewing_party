require 'rails_helper'
RSpec.describe 'user show page' do
  it 'can not access show page without login' do
    visit user_path
    expect(current_path).to_not eq(user_path(user.id))
    expect(current_path).to eq(root_path)
  end
end
