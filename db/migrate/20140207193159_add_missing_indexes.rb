class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :assets, :community_id
    add_index :assets, :author_id
    add_index :assets, :publication_id
    add_index :communities_users, [:community_id, :user_id]
    add_index :communities_users, [:user_id, :community_id]
    add_index :publications, :author_id
    add_index :publications, :community_id
    add_index :publications, [:id, :type]
  end
end