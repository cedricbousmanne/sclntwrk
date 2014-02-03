class CommunitiesUsers < ActiveRecord::Migration
  def self.up
    create_table :communities_users, :id => false do |t|
      t.integer :community_id
      t.integer :user_id
    end
  end
end
