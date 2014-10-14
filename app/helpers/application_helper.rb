module ApplicationHelper
  def pending_requests
    Friendship.unconfirmed_requests_for(current_user)
  end
end
