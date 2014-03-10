# DirectoryController : nodoc
class DirectoryController < PrivateController
  layout "left_sidebar"
  def index
    @users = current_community.users
  end

end
