class Users::InvitationsController < Devise::InvitationsController

  before_filter :authorize_invitation

  def create
    unless invite_resource.communities.include?(current_community)
      invite_resource.communities << current_community
      invite_resource.create_activity key: 'user.invited_by', owner: current_user, community_id: current_community.id
      invite_resource.save
      notice = "Un e-mail d'invation a été envoyé à #{invite_resource.email}"
    else
      notice = "#{invite_resource.email} fait déjà partie de la communauté"
    end
    redirect_to root_path, notice: notice
  end

  private

  def authorize_invitation
    authorize! :invite, current_community
  end

end
