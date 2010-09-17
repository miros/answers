module MarkdownHelper

  def render_markdown(text)
     doc = Maruku.new(text)
     doc.to_html.html_safe
  end


end