require 'spec_helper'

describe Publication do

  it "scope Publication in_community" do
    community_foo = create(:community, name: "foo", domain: "foo.com")
    community_bar = create(:community, name: "bar", domain: "bar.com")
    author_foo    = create(:user, email: "foo@foo.com", password: "secretsecret")
    author_bar    = create(:user, email: "bar@bar.com", password: "secretsecret")
    post_foo      = create(:post, author: author_foo, community_id: community_foo.id)
    post_bar      = create(:post, author: author_bar, community_id: community_bar.id)

    community_foo.should be_valid
    community_bar.should be_valid
    author_foo.should be_valid
    author_bar.should be_valid
    post_foo.should be_valid
    post_bar.should be_valid

    Post.in_community(community_foo.id).should eq([post_foo])
  end

  it "create a notification on create" do
    user      = create(:community_creator)
    community = user.communities.first
    expect {
      publication = Publication.create(author: user, community: community, content: "Foo")
    }.to change { PublicActivity::Activity.count }.from(0).to(1)
  end

end
