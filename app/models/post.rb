class Post < Publication
  hashtaggable_attribute :content
  include PublicActivity::Model
  tracked community_id: ->(controller, model) { model.community_id.inspect },
          owner: ->(controller, model) { model.author }

  validates :content, presence: true
end
