require 'spec_helper'

describe Comment do
  it "validates presence of content" do
    build(:comment, content: nil).should have(1).error_on(:content)
  end
  it "validates presence of author" do
    build(:comment, author: nil).should have(1).error_on(:author)
  end
  it "validates presence of community" do
    build(:comment, community: nil).should have(1).error_on(:community)
  end
  it "validates presence of commentable" do
    build(:comment, commentable: nil).should have(1).error_on(:commentable)
  end
  it "validates presence of content" do
    build(:comment, content: nil).should have(1).error_on(:content)
  end
  it "initialize new comment with type attribute" do
    build(:comment).read_attribute(:type).should eq("Comment")
  end
end
