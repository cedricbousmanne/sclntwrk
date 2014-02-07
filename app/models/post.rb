class Post < Publication
  self.per_page = 3
  hashtaggable_attribute :content
  include PublicActivity::Model
  tracked community_id: ->(controller, model) { model.community_id.inspect },
          owner: ->(controller, model) { model.author },
          trackable_type: ->(controller, model) { model.type }

  validates :content, presence: true
  has_many :comments, :as => :commentable
end
