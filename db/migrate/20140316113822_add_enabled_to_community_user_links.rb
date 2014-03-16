class AddEnabledToCommunityUserLinks < ActiveRecord::Migration
  def change
    add_column :community_user_links, :enabled, :boolean, default: true
  end
end
