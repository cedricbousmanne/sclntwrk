require "spec_helper"
require "cancan/matchers"
describe "User" do
  describe "abilities" do
    subject(:ability){ Ability.new(user) }
    let(:user){ nil }

    context "when is a user" do
      let(:user){ create(:user) }

      # should be able to create a new community
      it{ should be_able_to(:create, Community.new) }

      # should be able to read its own community
      it{ should be_able_to(:read, user.communities.first) }

      # should be able to read users from its community
      it{ should be_able_to(:read, User.joins(:communities).where("communities.id = ?", user.communities.first.id).last) }

      context "with post" do
        let(:user){ create(:user_with_post) }
        # should be able to read post within its own community
        it{ should be_able_to(:read, Post.where(community_id: user.communities.first.id).first) }
      end

    end

    context "when is a community creator" do
      let(:user){ create(:community_creator) }
      let(:community){ Community.joins(:roles).joins(:users).where('roles.name = "creator" AND users.id = ?', user.id).first }
      let(:other_community){ Community.where("id != ?", community.id).first }

      # should be able to invite other users to its community
      it { should be_able_to(:invite, community)}

      # should NOT be able to inviter other users in other communities
      it { should_not be_able_to(:invite, other_community)}
    end
  end
end