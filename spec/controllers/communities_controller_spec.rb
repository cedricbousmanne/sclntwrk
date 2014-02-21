require 'spec_helper'

describe CommunitiesController do
  login_user
  render_views
  # describe "GET 'index'" do
  #   it "returns http success" do
  #     get 'index'
  #     response.should be_success
  #   end
  # end

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
        post 'create', community: {name: "My new Community", private: false}
      }.to change{ Community.count }.by(1)

      community = assign[:community]

      raise community.inspect
    end
  end

  # describe "GET 'edit'" do
  #   it "returns http success" do
  #     get 'edit'
  #     response.should be_success
  #   end
  # end

  # describe "GET 'destroy'" do
  #   it "returns http success" do
  #     get 'destroy'
  #     response.should be_success
  #   end
  # end

end
