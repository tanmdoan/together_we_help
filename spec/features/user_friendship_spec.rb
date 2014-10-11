describe 'user friends' do

  let!(:user) { FactoryGirl.create(:user)}
  let!(:user2) { FactoryGirl.create(:user, name: 'marc')}

  it 'can view all users on the application' do
    sign_in
    click_link_or_button('Find Friends')

    expect(current_path).to eq(users_path)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user2.name)

  end

end
