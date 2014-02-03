module BackboneHelper
  def backbone_view_class_name
    action = case params[:action]
    when 'create' then 'New'
    when 'update' then 'Edit'
    else
      controller.action_name
    end.camelize
    "Application.Views.#{params[:controller].camelize.gsub("::", ".")}.#{action}View"
  end

  def backbone_view_data
    content_for?(:backbone_view_data) ? content_for(:backbone_view_data) : ''
  end
end