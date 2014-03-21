Receipt.class_eval do
  before_validation :set_community_id

  def set_community_id
    self.community_id = notification.notified_object.community_id
  end
end
