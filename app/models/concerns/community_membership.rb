module CommunityMembership
  extend ActiveSupport::Concern

  included do
    scope :enabled_in_community, ->(community) { joins(:community_user_links).where("community_user_links.community_id" => community.id, "community_user_links.enabled" => true) }
  end

  def community_user_link_for(community)
    community_user_links.where(community_id: community.id).first
  end

  def enabled_in_community?(community)
    community_user_link_for(community).enabled?
  end

  def disabled_for_community?(community)
    not enabled_in_community?(community)
  end

  def enable_for_community(community)
    community_user_link_for(community).update_attribute(:enabled, true)
  end

  def disable_for_community(community)
    community_user_link_for(community).update_attribute(:enabled, false)
  end

end
