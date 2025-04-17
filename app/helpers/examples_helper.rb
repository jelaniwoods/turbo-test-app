include ApplicationHelper

module ExamplesHelper
  def md(text)
    Redcarpet::Markdown.new(MarkdownRender, fenced_code_blocks: true, autolink: true).render(text).html_safe
  end
end
