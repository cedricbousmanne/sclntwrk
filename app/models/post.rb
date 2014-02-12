class Post < Publication
  self.per_page = 3
  hashtaggable_attribute :content

  validates :content, presence: true
  validates :community, :author, presence: true
  has_many :comments, :as => :commentable
end
