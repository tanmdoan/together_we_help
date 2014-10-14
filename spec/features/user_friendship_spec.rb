describe 'user' do

  let!(:user) { FactoryGirl.create(:user)}
  let!(:user2) { FactoryGirl.create(:user, name: 'marc')}

  it 'can view all users on the application' do
    sign_in
    find('.find-friends').click

    expect(current_path).to eq(users_path)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user2.name)

  end

  it 'can send a friend request' do
    user = FactoryGirl.create(:user)
    sign_in

    find('.find-friends').click
    first(:link, 'Send Friend Request').click

    expect(current_path).to eq(users_path)

    expect(page).to have_content('Request sent.')
  end

  it 'can view all pending friend requests' do
    sign_in
    user = User.where(email: 'bobgu@example.com').first_or_create
    user2 = FactoryGirl.create(:user, name: 'Chad Brading')

    user2.friends << user

    visit pending_requests_friendships_path

    expect(current_path).to eq(pending_requests_friendships_path)
    expect(page).to have_content(user2.name)
  end

  it 'can approve an incoming friend request' do
    sign_in
    user = User.where(email: 'bobgu@example.com').first_or_create
    user2 = FactoryGirl.create(:user, name: 'Chad Brading')

    user2.friends << user

    visit pending_requests_friendships_path
    first(:link, 'Approve').click
    expect(current_path).to eq(friendships_path)
    expect(page).to have_content(user2.name)

  end

end
