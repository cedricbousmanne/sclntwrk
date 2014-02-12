class PrivateController < ApplicationController
  before_filter :authenticate_user!
  helper_method :popular_hashtags, :recent_activities, :recent_members
  include Concerns::Members
  layout "application"

  def popular_hashtags
    @popular_hashtags ||= current_community.posts.includes(:hashtags).map(&:hashtags).flatten.uniq
  end

  def recent_activities
    @recent_activities ||= PublicActivity::Activity.where(community_id: current_community.id).order("created_at desc").includes(:owner, :trackable).limit(10)
  end
end