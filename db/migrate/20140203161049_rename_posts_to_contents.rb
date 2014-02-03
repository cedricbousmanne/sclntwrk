class RenamePostsToContents < ActiveRecord::Migration
  def self.up
    rename_table :posts, :publications
  end

  def self.down
    rename_table :publications, :posts
  end
end
