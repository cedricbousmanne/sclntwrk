require 'spec_helper'

describe CommentsController do
  login_user
  render_views

  describe "POST 'create'" do
    it "create an Comment to a Post" do

      post = FactoryGirl.create(:post, author: @current_user, community: @current_community)
      post.should be_valid

      expect{
        post 'create', post_id: post.id, comment: {content: "My new comment"}, format: :js
      }.to change{ post.comments.count }.from(0).to(1)
    end
  end
end
