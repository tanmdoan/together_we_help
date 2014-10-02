  def auth_mock
    OmniAuth.config.mock_auth[:facebook] = {
      provider: 'facebook',
      uid: '123',
      user_info: {
        name: 'bob gu',
        email: 'bobgu@example.com',
        location: 'Denver, CO'
      },
      credentials: {
        token: 'mock_token',
        secret: 'mock_secret'
      }
    }
  end

  def sign_in
    visit root_path
    expect(page).to have_content("Sign In")
    auth_mock
    click_link "Sign In"
  end
