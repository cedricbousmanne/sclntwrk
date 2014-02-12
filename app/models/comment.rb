class Comment < Publication
  hashtaggable_attribute :content
  include PublicActivity::Model
  tracked community_id: ->(controller, model) { model.community_id },
          owner: ->(controller, model) { model.author },
          trackable_type: ->(controller, model) { model.type }

  validates :content, presence: true
  validates :community, :author, :commentable, presence: true

  belongs_to :commentable, :polymorphic => true

  def commentable_type=(sType)
    super(sType.to_s.classify.constantize.base_class.to_s)
  end
end
