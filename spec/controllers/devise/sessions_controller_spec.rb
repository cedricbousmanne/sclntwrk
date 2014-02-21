require 'spec_helper'

describe Devise::SessionsController do

  render_views

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    controller.stub(:current_community) { create(:community) }
  end

  describe "GET 'new'" do
    it "returns http success and display sign_in form" do
      get 'new'
      response.should be_success
      response.body.should have_css("form#new_user")
      response.body.should have_css("input#user_email")
      response.body.should have_css("input#user_password")
      response.body.should have_css("input[type='submit']")
    end
  end

  describe "POST 'create'" do
    it "log the user" do
      password = "myFabulousPassword"
      user     = FactoryGirl.create(:user, password: password)

      post :create, user: { email: user.email, password: password }
      controller.current_user.should_not be_nil
      controller.current_user.should eq(user)
    end
  end

end
