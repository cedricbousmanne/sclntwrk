class Publication < ActiveRecord::Base
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :content

  belongs_to :author, class_name: User
  belongs_to :community


end