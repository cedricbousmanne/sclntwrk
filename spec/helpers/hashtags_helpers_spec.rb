require 'spec_helper'

describe HashtagsHelper do
  it "Transforms hashtags into links" do
    expect(helper.linkify_hashtags("foo #bar")).to eq("foo <a class=\"hashtag\" href=\"#{hashtag_path('#bar')}\">#bar</a>")
  end
end
