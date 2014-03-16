# PagesController : nodoc
class MembersController < PrivateController
  before_action :load_user, only: [:enable, :disable]
  def index
    @users = current_community.users
    authorize! :manage, current_community
  end

  def disable
    @user.disable_for_community(current_community)
    redirect_to members_path, notice: "#{@user.display_name} a été désactivé avec succès"
  end

  def enable
    @user.enable_for_community(current_community)
    redirect_to members_path, notice: "#{@user.display_name} a été activé avec succès"
  end

  private

  def load_user
    @user = current_community.users.find(params[:id])
    if @user == current_user
      redirect_to members_path, error: "Vous ne pouvez pas désactiver votre propre compte"
    end
  end
end
