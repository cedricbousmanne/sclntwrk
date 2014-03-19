# SearchController
class SearchController < PrivateController
  def index
    @posts = Post.search do
      fulltext params[:term]
      with :community_id, current_community.id
      paginate :page => params[:page], :per_page => 3
    end.results
  end
end
