class UserMailer < ApplicationMailer
  def activation_needed_email(user)
    @user = user
    @activation_token = @user.activation_token
    mail(to: user.email, subject: 'Activate your 3xLOGIC account')
  end

  def activation_success_email(user)
    @user = user
    mail(to: user.email, subject: 'Your 3xLOGIC account has been activated')
  end

  def register_email(user)
    @user = user
    @reset_password_token = @user.reset_password_token
    mail(to: user.email, subject: 'Welcome to 3xLOGIC')
  end

  def reset_password_email(user)
    @user = user
    @reset_password_token = @user.reset_password_token
    mail(to: user.email, subject: 'Reset Password Instructions')
  end

  def welcome_email(user)
    @user = user
    @reset_password_token = @user.reset_password_token
    mail(to: user.email, subject: 'Welcome to 3xLOGIC')
  end
end
