require 'spec_helper'

describe UsersController do
  login_user
  render_views

  describe "GET 'show'" do
    before(:each) do
      5.times do |i|
        @current_community.posts.create(content: "My content ##{i}", author: @current_user)
      end
    end
    it "returns http success and show user's publications" do
      get 'show', id: @current_user.id
      response.should be_success
      assigns(:user).should eq(@current_user)
      @current_user.posts.each do |post|
        response.body.should have_text(post.content)
      end
    end
  end
end
