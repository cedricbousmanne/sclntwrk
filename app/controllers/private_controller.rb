# PrivateController
class PrivateController < ApplicationController
  before_filter :authenticate_user!, :update_customerio
  helper_method :popular_hashtags, :recent_activities, :recent_members, :current_section
  include Concerns::Members
  layout 'application'

  def popular_hashtags
    @popular_hashtags = PopularHashtags.new(current_community).limit(5).order_by_popularity
  end

  def recent_activities
    @recent_activities ||= PublicActivity::Activity.where(community_id: current_community.id).order("created_at desc").includes(:owner, :trackable).limit(5)
  end

  def current_section
    if controller_name == "posts" && action_name == "index"
      "home"
    elsif controller_name == "directory"
      "directory"
    else
      ""
    end
  end

  private

  def current_ability
    @current_ability ||= Ability.new(current_user, current_community)
  end

  def update_customerio
    CustomerioWorker.perform_async(current_user.id)
  end
end
