class Publication < ActiveRecord::Base
  include SimpleHashtag::Hashtaggable
  include Notifiable::Notify
  hashtaggable_attribute :content

  include PublicActivity::Model
  tracked community_id: ->(controller, model) { model.community_id.inspect },
          owner: ->(controller, model) { model.author },
          trackable_type: ->(controller, model) { model.type }

  has_many :notifications, -> { where notified_object_type: 'Publication' }, foreign_key: :notified_object_id, dependent: :destroy

  has_many :assets
  belongs_to :author, class_name: User
  belongs_to :community

  accepts_nested_attributes_for :assets

  scope :in_community, ->(community_id) { where(:community_id => community_id)}

  after_save :create_notifications, on: :create

  def create_notifications
    subject = "#{author.display_name} a publié un nouveau contenu"
    body = "#{content}"
    notify_all(User.enabled_in_community(community), subject, body, self)
  end

end
