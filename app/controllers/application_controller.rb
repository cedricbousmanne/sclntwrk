# ApplicationController : nodoc
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_community
  include Concerns::Mailers
  before_action :set_locale, :set_mailer_config
  layout :layout_by_resource

  private

  def set_locale
    locale      = :fr
    locale      = current_user.locale if current_user
    I18n.locale = locale
  end

  def current_community
    @current_community ||= Community.find_by_domain(request.host)
  end

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

end
