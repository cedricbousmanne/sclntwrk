# CommunitiesController : nodoc
class CommunitiesController < PrivateController
  load_and_authorize_resource except: :create

  def index
  end

  def new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      @community.users << current_user
      current_user.add_role :creator, @community
      redirect_to @community, notice: 'Votre communauté a été créée avec succès'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @community.update_attributes(update_community_params)
      redirect_to edit_community_path(@community), notice: 'Votre communauté a été mise à jour'
    else
      render :edit
    end
  end

  private

  def community_params
    params.require(:community).permit(:name, :private, :domain)
  end

  def update_community_params
    params.require(:community).permit(:name, :private, :domain, :logo)
  end
end
