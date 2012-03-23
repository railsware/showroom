module ApplicationHelper
  
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given? 
    presenter
  end
  
  def menu_tab(title, url, css_class = "active")
    content_tag :li, (current_page?(url) ? ({class: "#{css_class}"}) : ({})) do
      link_to title, url
    end
  end
  
end
