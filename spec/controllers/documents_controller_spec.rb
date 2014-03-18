require 'spec_helper'

describe DocumentsController do
  login_user
  render_views

  def create_asset
    asset = FactoryGirl.create(:asset,
      file: fixture_file_upload('assets/urquart.jpg', 'image/jpg'),
      author: @current_user,
      community: @current_community
    )
    asset.should be_valid
    asset
  end

  describe "GET 'index'" do
    it "Lists documents" do
      asset = create_asset
      get 'index'
      assigns(:documents).should_not be_nil
      response.should be_success
      response.body.should have_content("urquart.jpg")
    end
  end

  describe "GET 'show'" do
    it "Display a single document" do
      asset = create_asset
      get 'show', id: asset.id
      response.should be_success
      response.body.should have_content("urquart.jpg")
      response.body.should have_css("a[href='#{download_document_path(asset)}']")
    end
  end

  describe "GET 'download'" do
    it "Allow a document to be downloaded" do
      asset = create_asset
      get 'download', id: asset.id
      response.should be_success
      response.header['Content-Type'].should eql 'image/jpeg'
    end
  end
end
