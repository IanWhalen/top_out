class UserMailer < ActionMailer::Base
  default from: "thetopout@gmail.com"

  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to The Top Out")
  end
end
