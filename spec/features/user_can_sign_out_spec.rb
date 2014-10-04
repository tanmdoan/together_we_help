require 'rails_helper'

describe 'user logout', type: :feature do

  it 'can sign out after logging in' do
    sign_in
    expect(page).to have_content("Log Out")
    click_link_or_button('Log Out')
    expect(page).to have_content('Facebook Log In')
  end
end
