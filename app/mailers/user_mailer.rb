class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup.subject
  #
  def signup(user, verification)
    @user = user
    @verification = verification
    
    @host = ActionMailer::Base.default_url_options[:host]
    
    mail to: @user.email, subject: "[Post] Verification required."
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.forgot.subject
  #
  def forgot(user, verification)
    @user = user
    @verification = verification
    
    @host = ActionMailer::Base.default_url_options[:host]
    
    mail to: @user.email, subject: "[Post] Forgot your password?"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    
    mail to: @user.email, subject: "[Post] Welcome! Thanks for signing up."
  end
end
