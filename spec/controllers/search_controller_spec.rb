require 'spec_helper'

describe SearchController do
  login_user
  render_views

  before(:all) do
    solr_setup
  end

  describe "GET 'index'" do
    before(:each) do
      other_community             = FactoryGirl.create(:community)
      @current_user.communities.push(other_community)

      @first_post                 = @current_community.posts.create(content: "First content", author: @current_user)
      @second_post                = @current_community.posts.create(content: "Mon contenu accentué", author: @current_user)
      @other_community_first_post = other_community.posts.create(content: "First content", author: @current_user)

    end
    it "render search results" do
      get 'index', term: "First"
      assigns[:posts].should eq([@first_post])
    end

    it "render search results with accented content" do
      get 'index', term: "accentué"
      assigns[:posts].should eq([@second_post])
    end
  end
end
