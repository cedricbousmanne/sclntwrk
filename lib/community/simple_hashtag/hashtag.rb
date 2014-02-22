module SimpleHashtag
  class Hashtag < ActiveRecord::Base
    HASHTAG_REGEX = /(?:)(#(?!(?:\d+|\w+?_|_\w+?)(?:\s|$))([a-z0-9\-_]+))/i

    def count
      @count ||= 0
    end

    def count=(i)
      @count = i
    end

  end
end
