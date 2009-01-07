# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def crumb_helper(text=nil, link=nil)
    @breadcrumbs = (link.nil? ? text : link_to(text, link))
  end
  def title_helper(text=nil, link=nil)
    @title = (link.nil? ? text : link_to(text, link))
  end
  def tab_helper(text, link=nil)
    @tabs ||= []
    @tabs << (link.nil? ? "<li class='current'>#{text}</li>" : "<li>#{link_to(text, link)}</li>")
  end
  def javascripts_helper(*args)
    @javascripts = args
  end
  def stylesheets_helper(*args)
    @stylesheets = args
  end
end
