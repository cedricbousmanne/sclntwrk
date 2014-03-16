class Community < ActiveRecord::Base
  resourcify
  dragonfly_accessor :logo

  has_many :community_user_links, inverse_of: :community
  has_many :users, through: :community_user_links, inverse_of: :communities
  has_many :posts, -> { extending PersistedExtension }
  has_many :assets, -> { extending PersistedExtension }

  validates :name, presence: true
  validates :domain, presence: true, domain: true

end
