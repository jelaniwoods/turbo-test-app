class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :rouge_syntax_highlighting

  def rouge_syntax_highlighting
    MarkdownViews.rouge_opts.merge! formatter: Rouge::Formatters::HTMLInline.new("github")
    MarkdownViews.extensions.merge! tagfilter: false
  end
end
