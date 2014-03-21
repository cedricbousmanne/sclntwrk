class AddCommunityIdToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :community_id, :integer
  end
end
