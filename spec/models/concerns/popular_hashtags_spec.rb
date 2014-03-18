require 'spec_helper'

describe PopularHashtags do
  before(:each) do
    @current_community = create(:community)
    @popular_hashtags = PopularHashtags.new(@current_community)
    @current_user = create(:user)
    @current_user.communities << @current_community
  end
  it "initizalize PopularHashtags for a given community" do
    @popular_hashtags.community.should eq(@current_community)
  end
  describe "counts and sort hashtags" do
    before(:each) do
      posts = @current_community.posts.create(
        [
          { content: "Test with #one hashtag",             community: @current_community, author: @current_user },
          { content: "Test with #one #two hashtags",       community: @current_community, author: @current_user },
          { content: "Test with #one #two #three hashtag", community: @current_community, author: @current_user },
        ]
      )
    end

    it "sorts hashtags by popularity" do
      ordered_hashtags = [
        SimpleHashtag::Hashtag.find_by_name("one"),
        SimpleHashtag::Hashtag.find_by_name("two"),
        SimpleHashtag::Hashtag.find_by_name("three")
      ]
      @popular_hashtags.order_by_popularity.should eq(ordered_hashtags)
    end

    it "counts hashtag use" do
      hashtags = @popular_hashtags.order_by_popularity
      hashtags[0].count.should eq(3)
      hashtags[1].count.should eq(2)
      hashtags[2].count.should eq(1)
    end

    it "limit the number of popular hashtags" do
      hashtags = @popular_hashtags.limit(1).order_by_popularity
      hashtags.size.should eq(1)

      hashtags = @popular_hashtags.limit(2).order_by_popularity
      hashtags.size.should eq(2)
    end

  end

  describe "#community" do
    it "returns @community" do
      @popular_hashtags.community.should eq(@current_community)
    end
  end

  describe "#limit=" do
    it "sets value for @limit" do
      @popular_hashtags.limit(10)
      @popular_hashtags.as_json['limit'].should eq(10)
      @popular_hashtags.limit(1)
      @popular_hashtags.as_json['limit'].should eq(1)
    end
  end
end
