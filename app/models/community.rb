class Community < ActiveRecord::Base
  resourcify
  has_and_belongs_to_many :users
  has_many :posts, -> { extending PersistedExtension }
  has_many :assets, -> { extending PersistedExtension }

  validates :name, presence: true
end
