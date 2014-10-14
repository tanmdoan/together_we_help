class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :uid, presence: true
  has_many :opportunities
  has_many :friendships
  has_many :friends, through: :friendships
  
  def self.find_or_create_by_auth(auth_data)
    user = self.find_or_initialize_by(provider: auth_data["provider"], uid: auth_data['uid'])
    unless user.persisted? && user.name == auth_data['info']['name']
      user.name       = auth_data['info']['name']
      user.first_name = auth_data['info']['first_name']
      user.email      = auth_data['info']['email']
      user.image      = auth_data['info']['image']
      user.location   = auth_data['info']['location']
      user.save!
    end
    return user
  end
end
