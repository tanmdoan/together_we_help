require 'rails_helper'

RSpec.describe User, :type => :model do
  it {should validate_presence_of (:name)}
  it {should validate_presence_of (:first_name)}
  it {should validate_presence_of (:email)}
  it {should validate_presence_of (:uid)}
  it {should have_many :opportunities}
  it {should have_many :friendships}
  it {should have_many :friends}
  it {should have_many :inverse_friendships}
  it {should have_many :inverse_friends}
end
