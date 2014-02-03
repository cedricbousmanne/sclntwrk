class AddCommunityIdToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :community_id, :integer
  end
end
