class Publication < ActiveRecord::Base
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :content

  has_many :assets
  belongs_to :author, class_name: User
  belongs_to :community

  accepts_nested_attributes_for :assets

end