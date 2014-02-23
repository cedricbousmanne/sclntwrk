class AddMissingIndexes2 < ActiveRecord::Migration
  def change
    add_index :simple_hashtag_hashtaggings, [:hashtag_id, :hashtaggable_id], name: "index_simple_hashtaggings_on_id_and_hashtagging_id"
    add_index :users, [:invited_by_id, :invited_by_type]
  end
end
