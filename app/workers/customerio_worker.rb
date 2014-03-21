class CustomerioWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user_id)
    customerio = Customerio::Client.new(CONFIG[:customerio][:id], CONFIG[:customerio][:key])
    user       = User.find(user_id)
    customerio.identify(
      id:           user.id,
      email:        user.email,
      created_at:   user.created_at.to_i,
      first_name:   user.firstname,
      last_name:    user.lastname,
      logged_in_at: Time.now.to_i
    )
  end
end
