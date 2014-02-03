module PersistedExtension
  def persisted
    select{|item| item if item.persisted?}
  end
end