require 'spec_helper'

describe CommunityMembership do
  before(:each) do
    @current_community = create(:community)
    @current_user = create(:user)
    @current_user.communities << @current_community
  end

  describe "#enabled_in_community?" do
    it "check if a User is enabled in a given Community" do
      @current_user.enabled_in_community?(@current_community).should be_true
      @current_user.disable_for_community(@current_community)
      @current_user.enabled_in_community?(@current_community).should be_false
    end
  end

  describe "#disabled_for_community?" do
    it "check if a User is disabled in a given Community" do
      @current_user.disabled_for_community?(@current_community).should be_false
      @current_user.disable_for_community(@current_community)
      @current_user.disabled_for_community?(@current_community).should be_true
    end
  end

  describe "#enable_for_community" do
    it "enable a User in a given community" do
      @current_user.disable_for_community(@current_community)
      expect{
        @current_user.enable_for_community(@current_community)
      }.to change{@current_user.community_user_link_for(@current_community).enabled}.from(false).to(true)
    end
  end

  describe "#disable_for_community" do
    it "disable a User in a given community" do
      expect{
        @current_user.disable_for_community(@current_community)
      }.to change{@current_user.community_user_link_for(@current_community).enabled}.from(true).to(false)
    end
  end
end
