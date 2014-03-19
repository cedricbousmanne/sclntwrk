class AddImageToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :image, :boolean
    Asset.find_each do |asset|
      asset.save
    end
  end
end
