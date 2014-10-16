class HardWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id.to_i)
    UserNotifier.friend_request_email(user).deliver
  end
end
