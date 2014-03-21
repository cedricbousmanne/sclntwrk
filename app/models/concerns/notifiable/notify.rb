module Notifiable::Notify
  extend ActiveSupport::Concern

  included do
    def notify_all(recipients, subject, body, obj = nil, sanitize_text = true, notification_code=nil, send_mail=true)
      notification = Notification.new({:body => body, :subject => subject})
      notification.community = self.community
      notification.sender = self.author
      notification.recipients = recipients.respond_to?(:each) ? recipients : [recipients]
      notification.recipients = notification.recipients.uniq if recipients.respond_to?(:uniq)
      notification.notified_object = obj if obj.present?
      notification.notification_code = notification_code if notification_code.present?
      notification.deliver sanitize_text, send_mail
    end
  end

end
