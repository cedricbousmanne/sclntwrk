class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_community, :popular_hashtags, :recent_activities, :recent_members
  include Concerns::Mailers
  include Concerns::Members
  before_action :set_mailer_config

  def popular_hashtags
    if current_community
      @popular_hashtags ||= current_community.posts.includes(:hashtags).map(&:hashtags).flatten.uniq
    end
  end

  def current_community
    @current_community ||= Community.find_by_domain(request.host)
  end

  def recent_activities
    if current_community
      @recent_activities ||= PublicActivity::Activity.where(community_id: current_community.id).order("created_at desc").includes(:owner, :trackable).limit(10)
    end
  end


end
