class AddCreatedAtToCommunityUserLinks < ActiveRecord::Migration
  def change
    add_column :community_user_links, :id, :primary_key, first: true
    add_column :community_user_links, :created_at, :datetime
    User.find_each{|u|
      u.community_user_links.all.each{|l|
        l.update_attribute(:created_at, u.created_at)
      }
    }
  end
end
