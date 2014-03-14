class RenameCommunitiesLogoIntoLogouid < ActiveRecord::Migration
  def change
    rename_column :communities, :logo, :logo_uid
  end
end
