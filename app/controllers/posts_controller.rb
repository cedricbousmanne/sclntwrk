class PostsController < ApplicationController
  load_and_authorize_resource :through => :current_community, except: :create
  respond_to :json

  def index
    @post = current_community.posts.new
    @posts = @posts.order("created_at desc").persisted
  end

  def show

  end

  def create
    @post = current_community.posts.new(post_params)
    @post.author = current_user
    @post.save
    respond_to do |format|
      format.html{
        if @post.save
          redirect_to posts_path()
        else
          render :new
        end
      }
      format.js{

      }
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
