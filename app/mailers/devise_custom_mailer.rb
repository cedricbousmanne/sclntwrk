class DeviseCustomMailer < Devise::Mailer
  layout "mailer"
  include Devise::Controllers::UrlHelpers

  def invitation_instructions(current_community, record, token, opts={})
    @current_community = current_community
    super(record, token, opts={})
  end


end
