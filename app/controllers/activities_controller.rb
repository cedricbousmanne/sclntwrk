# ActivitiesController : nodoc
class ActivitiesController < ApplicationController
  # load_and_authorize_resource through: :current_community
  respond_to :json

  def index
    @activities = PublicActivity::Activity.where(community_id: @current_community.id).all
  end

end
