class UsersController < ApplicationController
  def index
    @users = User.all.exclude(current_user)
  end
end
