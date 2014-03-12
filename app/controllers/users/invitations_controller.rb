class Users::InvitationsController < Devise::InvitationsController

  before_filter :authorize_invitation

  def create
    invite_resource.communities << current_community
    invite_resource.save
    invite_resource.create_activity key: 'user.invited_by', owner: current_user, community_id: current_community.id
    redirect_to root_path, notice: "Un e-mail d'invation a été envoyé à #{invite_resource.email}"
  end

  private

  def authorize_invitation
    authorize! :invite, current_community
  end

end
