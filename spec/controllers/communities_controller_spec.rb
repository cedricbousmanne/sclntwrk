require 'spec_helper'

describe CommunitiesController do
  login_user
  render_views

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
      response.body.should have_css("form#new_community")
      response.body.should have_css("input#community_name")
      response.body.should have_css("input#community_private")
      response.body.should have_css("input[type='submit']")
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      expect{
        post 'create', community: build(:community).attributes
      }.to change{ Community.count }.by(1)

      community = assigns[:community]

      @current_user.roles.where(name: "creator", resource_type: "Community", resource_id: community.id).size.should eq(1)

    end
  end

  describe "GET 'edit'" do
    it "returns http success for creator" do
      post 'create', community: build(:community).attributes
      community = assigns[:community]
      get 'edit', id: community.id
      response.should be_success
    end

    it "raises CanCan::AccessDenied for non-creator" do
      community = FactoryGirl.create(:community)
      expect{
        get 'edit', id: community.id
      }.to raise_error(CanCan::AccessDenied)
    end
  end

end
