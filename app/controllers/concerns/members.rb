module Concerns
  module Members

    private

    def recent_members
      if current_community
        @recent_members ||= current_community.users.limit(5)
      end
    end

  end
end
