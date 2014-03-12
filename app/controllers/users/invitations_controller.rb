class Users::InvitationsController < Devise::InvitationsController

  before_filter :authorize_invitation

  def create
    invited_user = User.invite!(params[:user]) do |u|
      u.skip_invitation = true
    end
    unless invited_user.communities.include?(current_community)
      invited_user.communities << current_community
      invited_user.create_activity key: 'user.invited_by', owner: current_user, community_id: current_community.id
      invited_user.save
      notice = "Un e-mail d'invation a été envoyé à #{invite_resource.email}"
    else
      notice = "#{invited_user.email} fait déjà partie de la communauté"
    end
    redirect_to root_path, notice: notice
  end

  private

  def authorize_invitation
    authorize! :invite, current_community
  end

end
