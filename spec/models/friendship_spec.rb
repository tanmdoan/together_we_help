require 'rails_helper'

RSpec.describe Friendship, :type => :model do
  it {should belong_to :user}
  it {should belong_to :friend}
  it {should validate_uniqueness_of :friend_id}
end
