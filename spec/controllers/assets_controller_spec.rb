require 'spec_helper'

describe AssetsController do
  login_user
  render_views

  def expected_json(asset)
    { id: asset.id, file_uid: asset.file_uid, thumb_url: asset.file.thumb("100x100#").url }.to_json
  end

  describe "POST 'create'" do
    it "create an Asset" do
      file = fixture_file_upload('assets/urquart.jpg', 'image/jpg')
      expect{
        post 'create', asset: {file: file}, format: :json
      }.to change{ Asset.count }.from(0).to(1)

      asset    = assigns[:asset]

      response.body.should eq(expected_json(asset))
    end
  end

  describe "GET 'show'" do
    it "returns an asset as JSON value" do
      file = fixture_file_upload('assets/urquart.jpg', 'image/jpg')
      post 'create', asset: {file: file}, format: :json
      asset = assigns[:asset]
      get 'show', id: asset.id, format: :json
      response.body.should eq(expected_json(asset))
    end
  end
end
