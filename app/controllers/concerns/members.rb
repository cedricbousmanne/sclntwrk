module Concerns
  # nodoc
  module Members

    private

    def recent_members
      (@recent_members ||= current_community.community_user_links.order("created_at desc").limit(5).map(&:user)) if current_community
    end
  end
end
