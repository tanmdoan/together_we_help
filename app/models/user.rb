class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true

  def self.find_or_create_by_auth(auth_data)
    user = self.find_or_create_by(provider: auth_data["provider"], uid: auth_data['uid'])
    if user.name != auth_data['info']['name']
      user.name       = auth_data['info']['name']
      user.uid        = auth_data['info']['uid']
      user.first_name = auth_data['info']['first_name']
      user.email      = auth_data['info']['email']
      user.image      = auth_data['info']['image']
      user.location   = auth_data['info']['location']
      user.save
    end
    return user
  end
end
