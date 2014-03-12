class RenameCommunitiesUsersIntoCommunityUserLinks < ActiveRecord::Migration
  def change
    rename_table :communities_users, :community_user_links
  end
end
