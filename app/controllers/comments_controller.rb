class CommentsController < ApplicationController
  load_and_authorize_resource :through => :current_community, except: :create
  respond_to :json

  def create
    @comment = commentable.comments.new(comment_params)
    @comment.author = current_user
    @comment.community = current_community
    @comment.save
    respond_to do |format|
      format.html{
        if @comment.save
          redirect_to :back, :notice => "Votre commentaire a été publié"
        else
          render :new
        end
      }
      format.js{

      }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
