class AddDomainToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :domain, :string
  end
end
