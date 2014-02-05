class AddCommentableToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :commentable_id, :integer
    add_column :publications, :commentable_type, :string
    add_index  :publications, :commentable_id
    add_index  :publications, :commentable_type
  end
end
