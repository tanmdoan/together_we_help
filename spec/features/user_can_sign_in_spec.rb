require 'rails_helper'

describe 'user log in', type: :feature do

  it 'can sign in with valid account' do
    sign_in
    expect(page).to have_content("Log Out")
  end

  it 'cannot sign in with an invalid account' do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    visit root_path
    click_link_or_button('Facebook Log In')
    expect(page).to have_content('Authentication Error')
  end
end
