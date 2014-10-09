  def auth_mock
    OmniAuth.config.mock_auth[:facebook] =  OmniAuth::AuthHash.new({
      provider: 'facebook',
      uid: '123',
      info: {
        name: 'bob gu',
        first_name: 'bob',
        email: 'bobgu@example.com',
        location: 'Denver, CO'
      },
      credentials: {
        token: 'mock_token',
        secret: 'mock_secret'
      }
    })
  end

  def sign_in
    visit root_path
    expect(page).to have_content("Log In")
    auth_mock
    click_link "Log In"
  end
