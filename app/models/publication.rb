class Publication < ActiveRecord::Base
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :content

  include PublicActivity::Model
  tracked community_id: ->(controller, model) { model.community_id.inspect },
          owner: ->(controller, model) { model.author },
          trackable_type: ->(controller, model) { model.type }

  has_many :assets
  belongs_to :author, class_name: User
  belongs_to :community

  accepts_nested_attributes_for :assets

  scope :in_community, ->(community_id) { where(:community_id => community_id)}

end