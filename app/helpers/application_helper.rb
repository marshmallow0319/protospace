module ApplicationHelper
  def active?(contoroller_name)
    return "active" if contoroller_name == params[:controller]
  end
end
