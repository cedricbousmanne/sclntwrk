require 'spec_helper'

describe AssetsController do
  login_user
  render_views

  def expected_json(asset)
    { id: asset.id, file_uid: asset.file_uid, image: asset.image, name: asset.name, thumb_url: asset.file.thumb("100x100#").url }.to_json
  end

  def check_file_upload(file)
    expect{
      post 'create', asset: {file: file}, format: :json
    }.to change{ Asset.count }.from(0).to(1)

    asset    = assigns[:asset]

    response.body.should eq(expected_json(asset))
  end

  describe "POST 'create'" do
    it "create an Asset" do
      file = fixture_file_upload('assets/urquart.jpg', 'image/jpg')
      check_file_upload(file)
    end

    it "create an Assent with accented characters in the filename" do
      file = fixture_file_upload('assets/caractère-accentué.txt', 'text/plain')
      check_file_upload(file)
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

  describe "DEL 'destroy'" do
    it "destroy an asset" do
      file = fixture_file_upload('assets/caractère-accentué.txt', 'text/plain')
      check_file_upload(file)
      asset = assigns[:asset]
      expect{
        delete 'destroy', id: asset.id, format: :json
      }.to change { Asset.count }.from(1).to(0)
    end
  end
end
