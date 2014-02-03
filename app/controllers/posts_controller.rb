class PostsController < ApplicationController
  load_and_authorize_resource :through => :community, except: :create

  def index
    @post = community.posts.new
    @posts = @posts.persisted
  end

  def show

  end

  def create
    @post = community.posts.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to community_posts_path(@community)
    else
      render :new
    end
  end

  private

  def community
    @community = Community.find(params[:community_id])
  end

  def post_params
    params.require(:post).permit(:content)
  end

end
