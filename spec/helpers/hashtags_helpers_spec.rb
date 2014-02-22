require 'spec_helper'

describe HashtagsHelper do
  it "Transforms hashtags into links" do
    expect(helper.linkify_hashtags("foo #bar")).to eq("foo <a class=\"hashtag\" href=\"#{hashtag_path('bar')}\">#bar</a>")
    expect(helper.linkify_hashtags("This is a #message with a #hashtag")).to eq("This is a <a class=\"hashtag\" href=\"#{hashtag_path('message')}\">#message</a> with a <a class=\"hashtag\" href=\"#{hashtag_path('hashtag')}\">#hashtag</a>")
  end
end
