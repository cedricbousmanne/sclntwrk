class PopularHashtags
  def initialize(community)
    @community = community
  end

  def community
    @community
  end

  def all
    @all ||= community.posts.includes(:hashtags).map(&:hashtags).flatten
  end

  def hashtags_with_count
    @hashtags_with_count ||= all.each{|hashtag| hashtag.count += 1}
  end

  def order_by_popularity
    hashtags_with_count.sort_by{|hashtag| -hashtag.count}.uniq
  end

end