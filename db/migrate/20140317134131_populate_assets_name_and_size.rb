class PopulateAssetsNameAndSize < ActiveRecord::Migration
  def change
    Asset.find_each do |asset|
      file = asset.file
      asset.update_attributes({
        name: file.name,
        size: file.size
      })
    end
  end
end
