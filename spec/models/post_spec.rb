require 'spec_helper'

describe Post do
  it "validates presence of content" do
    build(:post, content: nil).should have(1).error_on(:content)
  end
  it "validates presence of author" do
    build(:post, author: nil).should have(1).error_on(:author)
  end
  it "validates presence of community" do
    build(:post, community: nil).should have(1).error_on(:community)
  end
  it "validates presence of content" do
    build(:post, content: nil).should have(1).error_on(:content)
  end
  it "initialize new post with type attribute" do
    build(:post).read_attribute(:type).should eq("Post")
  end
end
