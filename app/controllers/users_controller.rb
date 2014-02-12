class UsersController < PrivateController
  load_and_authorize_resource :through => :current_community
  respond_to :json

  def show
    @posts = @user.posts.in_community(current_community).page(params[:page])
  end

end
