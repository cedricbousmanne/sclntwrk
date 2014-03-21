class NotificationsMailer < ActionMailer::Base
  layout "mailer"
  default from: "no-reply@sclntwrk.com"

  def notifications_email(current_community, user, notifications)
    @current_community = current_community
    @user              = user
    @notifications     = notifications
    
    mail(to: user.email, subject: "Nouvelles notifications")
  end

end
