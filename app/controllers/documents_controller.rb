# DocumentsController : nodoc
class DocumentsController < PrivateController
  layout "left_sidebar"
  before_action :load_document, only: [:show, :download]
  
  def index
    @documents = current_community.assets
    @documents = @documents.includes(:author)
    @documents = @documents.page(params[:page]).order("created_at desc")
    @documents = AssetDecorator.decorate_collection(@documents)
  end

  def show
    @document = @document.decorate
  end

  def download
    @document.increment!(:download_count)

    original_filename = File.basename @document.file.remote_url
    url = @document.file.remote_url(expires: 10.minutes.from_now)
    string_io = HTTParty.get(url)
    send_data string_io, :filename => original_filename
  end

  private

  def load_document
    @document = current_community.assets.find(params[:id])
  end

end
