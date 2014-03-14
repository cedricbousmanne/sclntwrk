class Users::InvitationsController < Devise::InvitationsController

  before_filter :authorize_invitation, only: :create

  def create
    invited_user = User.invite!(params[:user]) do |u|
      u.skip_invitation = true
    end
    unless invited_user.communities.include?(current_community)
      invited_user.communities << current_community
      invited_user.create_activity key: 'user.invited_by', owner: current_user, community_id: current_community.id
      invited_user.skip_invitation = true
      invited_user.invitation_sent_at = Time.now
      invited_user.invited_by = current_user
      raw, enc = Devise.token_generator.generate(invited_user.class, :invitation_token)
      invited_user.invitation_token = enc
      invited_user.save
      # invited_user.deliver_invitation(current_community)
      DeviseCustomMailer.invitation_instructions(current_community, invited_user, raw).deliver
      notice = "Un e-mail d'invation a été envoyé à #{invited_user.email}"
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
