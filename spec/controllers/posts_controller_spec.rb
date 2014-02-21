require 'spec_helper'

describe PostsController do
  login_user
  render_views

  describe "POST 'create'" do
    it "create a post" do
      expect{
        post 'create', post: {content: "My new publication"}
      }.to change{ Post.count }.from(0).to(1)

      response.code.should == "302"
      response.should redirect_to(posts_path)
    end

    it "create a post with an asset" do
      file = fixture_file_upload('assets/urquart.jpg', 'image/jpg')
      asset = Asset.create(file: file, community: @current_community, author: @current_user)
      asset.should be_valid

      expect{
        post 'create', post: {content: "My new publication", asset_ids: [asset.id]}
      }.to change{ Post.count }.from(0).to(1)

      post = assigns[:post]
      post.assets.size.should eq(1)

      response.code.should == "302"
      response.should redirect_to(posts_path)
    end
  end

end
