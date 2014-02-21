module Concerns
  # nodoc
  module Members

    private

    def recent_members
      (@recent_members ||= current_community.users.limit(5)) if current_community
    end
  end
end