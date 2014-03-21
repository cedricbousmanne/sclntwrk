class Comment < Publication
  hashtaggable_attribute :content
  include PublicActivity::Model
  include Notifiable::Notify
  tracked community_id: ->(controller, model) { model.community_id },
          owner: ->(controller, model) { model.author },
          trackable_type: ->(controller, model) { model.type }

  validates :content, presence: true
  validates :community, :author, :commentable, presence: true

  belongs_to :commentable, :polymorphic => true

  after_save :create_notifications, on: :create

  def create_notifications
    subject = "#{author.display_name} a publié un nouveau commentaire"
    body = "#{content}"
    notify_all(User.enabled_in_community(community), subject, body, self)
  end

  def commentable_type=(sType)
    super(sType.to_s.classify.constantize.base_class.to_s)
  end
end
