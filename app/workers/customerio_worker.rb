class CustomerioWorker
  include Sidekiq::Worker

  def perform(user_id)
    customerio = Customerio::Client.new(CONFIG[:customerio][:id], CONFIG[:customerio][:key])
    user       = User.find(user_id)
    customerio.identify(
      id:           user.id,
      email:        user.email,
      created_at:   user.created_at.to_s(:db),
      first_name:   user.firstname,
      last_name:    user.lastname,
      logged_in_at: Time.now.to_s(:db)
    )
  end
end
