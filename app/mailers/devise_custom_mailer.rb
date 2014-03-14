class DeviseCustomMailer < Devise::Mailer
  layout "mailer"
  include Devise::Controllers::UrlHelpers
end
