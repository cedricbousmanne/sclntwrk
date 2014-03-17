class AssetDecorator < ApplicationDecorator
  decorates :asset
  delegate_all
  
  def created_at_link
    if object.publication.present?
      link_to l(object.created_at, format: :long), object.publication
    else
      l(object.created_at, format: :long)
    end
  end
end
