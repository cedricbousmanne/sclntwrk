class CommunitiesController < ApplicationController
  load_and_authorize_resource except: :create

  def index
  end

  def new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      @community.users << current_user
      redirect_to @community, notice: I18n.t("notices.communities.created", default: "Your community was created successfully")
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  def show

  end

  private

  def community_params
    params.require(:community).permit(:name, :private)
  end
end
