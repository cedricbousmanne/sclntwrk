class AddTypeToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :type, :string, default: "Post"
  end
end
