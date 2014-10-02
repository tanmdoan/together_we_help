require 'rails_helper'

describe 'user logout', type: :feature do

  it 'can sign in with valid account' do
    sign_in
    expect(page).to have_content("Log Out")
  end
end
