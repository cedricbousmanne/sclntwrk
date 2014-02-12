require 'spec_helper'

describe Asset do
  it "validates presence of community" do
    build(:asset, community: nil).should have(1).error_on(:community)
  end
  it "validates presence of author" do
    build(:asset, author: nil).should have(1).error_on(:author)
  end
  it "validates presence of publication" do
    build(:asset, publication: nil).should have(1).error_on(:publication)
  end
end
