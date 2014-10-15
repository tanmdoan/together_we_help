class FriendshipsController < ApplicationController
  def index
    @friends = current_user.find_my_friends
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    if @friendship.save
      flash[:notice] = "Request sent."
      redirect_to users_path
    else
      flash[:notice] = "Unable to send request."
      redirect_to users_path
    end
  end

  def destroy
    @friendship = Friendship.find_by(user_id: params[:id], friend_id: current_user.id, confirmed: true)
    if @friendship.destroy
      redirect_to friendships_path, notice = 'Successfully blocked user!'
    else
      render friendships_path, alert = 'Failed to block user!'
    end
  end

  def pending_requests
    requests   = Friendship.unconfirmed_requests_for(current_user)
    friend_ids = requests.map(&:user_id)

    @unconfirmed_friends = User.where(id: friend_ids)
  end

  def approve
    @friendship = Friendship.find_by(user_id: params[:id], friend_id: current_user.id, confirmed: false)

    if @friendship && @friendship.toggle!(:confirmed)
      redirect_to friendships_path, notice: 'Friend request approved!'
    else
      render pending_requests_friendships_path, alert: 'Approval failed!'
    end
  end

end
