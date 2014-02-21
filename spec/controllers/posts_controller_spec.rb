require 'spec_helper'

describe PostsController do
  login_user
  render_views

  describe "GET 'index'" do
    it "list a community's posts" do
      posts = [
        @current_community.posts.create(content: "My first post", author: @current_user),
        @current_community.posts.create(content: "My second post", author: @current_user),
      ]

      other_community       = create(:community)
      other_community_user  = create(:user)
      other_community_user.communities << other_community

      other_community_posts = [
        other_community.posts.create(content: "My third post", author: other_community_user),
        other_community.posts.create(content: "My fourth post", author: other_community_user),
      ]

      get 'index'

      response.code.should == "200"

      posts.each do |post|
        response.body.should have_text(post.content)
      end

      other_community_posts.each do |post|
        response.body.should_not have_text(post.content)
      end
    end
  end

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
