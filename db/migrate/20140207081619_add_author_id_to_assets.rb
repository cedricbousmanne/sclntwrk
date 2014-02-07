class AddAuthorIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :author_id, :integer
  end
end
