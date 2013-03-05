class UserMailer < ActionMailer::Base
  default from: "info@flightclimbers.com"

  def welcome_email(user)
  	@user = user
  	mail(to: user.email, subject: "Welcome")
  end

def reset_password_email(user)
  @user = user
  @url  = "http://flightclimbers.com/password_resets/#{user.reset_password_token}/edit"
  mail(:to => user.email,
       :subject => "Your password has been reset")
end

end
