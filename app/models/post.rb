class Post < ActiveRecord::Base
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :content

  include PublicActivity::Model
  tracked community_id: ->(controller, model) { model.community_id.inspect },
          owner: ->(controller, model) { model.author }

  belongs_to :author, class_name: User
  belongs_to :community

  validate :content, presence: true
end
