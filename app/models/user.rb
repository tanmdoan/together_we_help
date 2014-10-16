class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :uid, presence: true
  has_many :opportunities
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  


  def self.find_or_create_by_auth(auth_data)
    user = self.find_or_initialize_by(provider: auth_data["provider"], uid: auth_data['uid'])
    unless user.persisted? && user.name == auth_data['info']['uid']
      user.name       = auth_data['info']['name']
      user.first_name = auth_data['info']['first_name']
      user.email      = auth_data['info']['email']
      user.image      = auth_data['info']['image']
      user.location   = auth_data['info']['location']
      user.save!
    end
      return user
      check_new(user)
  end

  def check_new(user)
    if user.new_user == true
      user.new_user.toggle!
      UserNotifier.welcome_email(user).deliver
    else
      user
    end
  end

  def self.excludes(user)
    ids = user.inverse_friendships
                     .map { |x| [x.user_id, x.friend_id] }
                     .flatten
                     .reject { |x| x == user.id }
    self.where.not(id: ids, email: user.email)


  end




  def find_my_friends
    friendships = Friendship.get_friends_for(self)
    ids = finding_ids_from(friendships)

    User.find(ids)
  end

  def finding_ids_from(friendships)
    friendships.map { |x| [x.user_id, x.friend_id] }
                     .flatten
                     .reject { |x| x == id }
  end

end
