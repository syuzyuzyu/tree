class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
  def hello
    @greeting = "Hi" 
    mail to: "xmpgx751@yahoo.co.jp"
  end
end
