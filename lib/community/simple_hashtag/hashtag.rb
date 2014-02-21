module SimpleHashtag
  class Hashtag < ActiveRecord::Base
    def count
      @count ||= 0
    end
    def count=(i)
      @count = i
    end
  end
end
