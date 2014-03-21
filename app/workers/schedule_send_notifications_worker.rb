class ScheduleSendNotificationsWorker
  include Sidekiq::Worker

  def perform
    # Find users with outstanding notifications, and deal with each in
    # a different job
    user_ids = User.
      joins(:receipts).
      where('confirmed_at IS NOT NULL').
      where(receipts: {is_read: false}).
      select('DISTINCT users.id').
      map(&:id)

    user_ids.each do |user_id|
      SendNotificationsWorker.perform_async(user_id)
      Rails.logger.info "Scheduled a job to send notifications to user #{user_id}"
    end
  end
end
