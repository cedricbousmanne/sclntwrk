class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_community, :popular_hashtags, :recent_activities

  def popular_hashtags
    if current_community
      @popular_hashtags ||= current_community.posts.map(&:hashtags).flatten.uniq
    end
  end

  def current_community
    @current_community ||= params[:community_id].present? ? Community.find(params[:community_id]) : nil
  end

  def recent_activities
    if current_community
      @recent_activities ||= PublicActivity::Activity.where(community_id: current_community.id).order("created_at desc").limit(10)
    end
  end


end
