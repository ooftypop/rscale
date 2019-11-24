module LayoutsHelper

  def nav_classes
    classes = "navbar navbar-expand-lg navbar-light fixed-top"
    classes = classes + 'signed-in-navbar' if ['static_pages'].exclude?(controller_name)

    return classes
  end
end
