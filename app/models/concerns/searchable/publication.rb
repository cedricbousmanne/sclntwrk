module Searchable::Publication
  extend ActiveSupport::Concern

  included do
    searchable do
      text :content

      text :comments do
        comments.map{ |comment| comment.content }
      end

      text :assets do
        assets.map{ |asset| asset.name }
      end

      integer :author_id
      integer :community_id

    end
  end

end
