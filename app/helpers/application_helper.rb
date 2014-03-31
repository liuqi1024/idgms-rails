module ApplicationHelper
  def nav_to(name ,path, active=nil)
    if active == params[:controller]
      content_tag(:li, (link_to name, path), :class => "active")
    else
      content_tag(:li, (link_to name, path))
    end
  end
end

