class HardWorker
  include Sidekiq::Worker

  def perform(user_id, count)
    user = User.find(user_id)
    UserNotifier.friend_request_email(user).deliver
  end
end
