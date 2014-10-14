class FriendshipsController < ApplicationController
  def index
    @users = User.all
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

  def pending_requests
    requests   = Friendship.unconfirmed_requests_for(current_user)
    friend_ids = requests.map(&:user_id)

    @unconfirmed_friends = User.where(id: friend_ids)
  end

end
