class SendNotificationsWorker
  include Sidekiq::Worker

  COOLDOWN_PERIOD = 1.second # 4.minutes

  def perform(user_id)
    user = User.find(user_id)

    user.communities.each do |community|

      ActiveRecord::Base.transaction do
        receipts = user.receipts.where(is_read: false, community_id: community.id).lock(true)

        most_recent = receipts.map(&:created_at).max

        if most_recent && (most_recent < (Time.now - COOLDOWN_PERIOD))
          notifications = Notification.find(receipts.map(&:notification_id))
          Rails.logger.info "Sending #{notifications.size} notification(s) to #{user.email}"
          NotificationsMailer.notifications_email(community, user, notifications).deliver
          receipts.update_all(is_read: true)
        else
          Rails.logger.info "Waiting before sending notifications to #{user.email} / community #{community.id}"
        end
      end
    end
  end
end
