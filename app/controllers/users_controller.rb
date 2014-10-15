class UsersController < ApplicationController
  def index
    @users = User.all.excludes(current_user)
  end
end
