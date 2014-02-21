require 'spec_helper'

describe ProfilesController do
  login_user
  render_views

  describe "GET 'edit'" do
    it "returns http success and render user profile form" do
      get 'edit'
      response.should be_success
      assigns(:user).should eq(@current_user)
      response.body.should have_css("form.edit_user")
      response.body.should have_css("input#user_firstname")
      response.body.should have_css("input#user_lastname")
      response.body.should have_css("input[name='user[photo]']")
      response.body.should have_css("input[type='submit']")
    end

    describe "PUT 'update'" do
      it "allow a user to update his profile" do
        current_firstname = @current_user.firstname
        current_lastname  = @current_user.lastname

        put 'update', user: {firstname: "My new firstname"}
        @current_user.reload
        @current_user.firstname.should eq("My new firstname")

        put 'update', user: {lastname: "My new lastname"}
        @current_user.reload
        @current_user.lastname.should eq("My new lastname")

      end
    end
  end

end
