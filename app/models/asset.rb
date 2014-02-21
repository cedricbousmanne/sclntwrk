class Asset < ActiveRecord::Base
  belongs_to :community
  belongs_to :author, class_name: User
  belongs_to :publication
  dragonfly_accessor :file

  validates :community, :author, presence: true
end
