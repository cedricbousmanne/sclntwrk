class PostsController < ApplicationController
  load_and_authorize_resource :through => :current_community, except: :create

  def index
    @post = current_community.posts.new
    @posts = @posts.persisted
  end

  def show

  end

  def create
    @post = current_community.posts.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to posts_path()
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
