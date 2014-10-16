class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'
  validates :friend_id, :uniqueness => {:scope => :user}

  scope :unconfirmed_requests_for, ->(user) { where(confirmed: false).where(friend_id: user.id) }

  def self.get_friends_for(user)
    where("(user_id = ? or friend_id = ?) and confirmed = ?", user.id, user.id, true)
  end
end
