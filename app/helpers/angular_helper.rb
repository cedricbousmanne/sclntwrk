module AngularHelper
  def angular_controller(value)
    content_for(:angular_controller) { value }
  end
end