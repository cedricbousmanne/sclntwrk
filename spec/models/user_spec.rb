require 'spec_helper'

describe User do
  it "returns display_name" do
    user_one = build(:user, email: "foo1@foo.com", password: "secretsecret")
    user_one.display_name.should eq("foo1@foo.com")

    user_two = build(:user, email: "foo2@foo.com", firstname: "Henry", password: "secretsecret")
    user_two.display_name.should eq("Henry")

    user_three = build(:user, email: "foo3@foo.com", firstname: "Georges", lastname: "Dupont", password: "secretsecret")
    user_three.display_name.should eq("Georges Dupont")
  end

  it "has many posts" do
    community_one = create(:community, name: "foo", domain: "foo.com")

    user_one   = create(:user, email: "foo1@foo.com", password: "secretsecret")
    user_two   = create(:user, email: "foo2@foo.com", password: "secretsecret")
    user_one.communities << community_one
    user_two.communities << community_one

    post_one   = create(:post, content: "content", author: user_one, community: community_one)
    post_two   = create(:post, content: "content", author: user_one, community: community_one)
    post_three = create(:post, content: "content", author: user_two, community: community_one)

    user_one.posts.should eq([post_one, post_two])
  end

  it "has many comments" do
    community_one = create(:community, name: "foo", domain: "foo.com")

    user_one   = create(:user, email: "foo1@foo.com", password: "secretsecret")
    user_one.communities << community_one
    user_two   = create(:user, email: "foo2@foo.com", password: "secretsecret")
    user_two.communities << community_one

    post_one   = create(:post, content: "content", author: user_one, community: community_one)
    post_two   = create(:post, content: "content", author: user_one, community: community_one)
    post_three = create(:post, content: "content", author: user_two, community: community_one)

    comment_one   = create(:comment, content: "content", author: user_one, community: community_one, commentable: post_one)
    comment_two   = create(:comment, content: "content", author: user_one, community: community_one, commentable: post_one)
    comment_three = create(:comment, content: "content", author: user_two, community: community_one, commentable: post_one)

    user_one.comments.should eq([comment_one, comment_two])
  end

  it "has a photo fallback" do
    user_one = create(:user, email: "foo1@foo.com", password: "secretsecret")
    user_one.photo.url.should_not be_empty
  end
end
