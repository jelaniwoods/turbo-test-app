class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :markdown_views_configuration

  def markdown_views_configuration
    MarkdownViews.rouge_opts.merge! formatter: Rouge::Formatters::HTMLInline.new("github")
    MarkdownViews.extensions.merge! tagfilter: false, tasklist: true
  end
end
