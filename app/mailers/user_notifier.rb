class UserNotifier < ActionMailer::Base
  default from: "mailer@togetherwehelp.com"

  def welcome_email(user)
    @user = user
    mail(:to => @user.email, :submit => 'Welcome Aboard!')
  end

  def friend_request_email(user)
    @user = user
    mail(:to => @user.email, :submit => 'Friend Request')
  end
end
