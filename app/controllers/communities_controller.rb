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

  def destroy
  end

  def show

  end

  private

  def community_params
    params.require(:community).permit(:name, :private)
  end
end
