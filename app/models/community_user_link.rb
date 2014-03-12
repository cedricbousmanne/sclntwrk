class CommunityUserLink < ActiveRecord::Base

  belongs_to :user,      inverse_of: :community_user_links
  belongs_to :community, inverse_of: :community_user_links

end
