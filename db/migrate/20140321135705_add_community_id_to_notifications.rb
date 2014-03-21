class AddCommunityIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :community_id, :integer
  end
end
