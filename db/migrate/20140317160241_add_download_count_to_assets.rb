class AddDownloadCountToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :download_count, :integer, default: 0
  end
end
