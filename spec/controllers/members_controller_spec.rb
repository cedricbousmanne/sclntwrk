require 'spec_helper'

describe MembersController do
  render_views

  describe "GET 'index'" do
    context "as the community creator" do
      login_creator
      it "returns http success for creator" do
        get 'index'
        response.should be_success
      end
    end
    context "as a user" do
      login_user
      it "raises CanCan::AccessDenied for non-creator" do
        @current_community = FactoryGirl.create(:community)
        expect{
          get 'index'
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end

end
