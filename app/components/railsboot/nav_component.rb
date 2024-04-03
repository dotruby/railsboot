class Railsboot::NavComponent < Railsboot::Component
  STYLES = ["", "tabs", "pills", "underline"].freeze
  DEFAULT_STYLE = "".freeze

  WIDTHS = ["", "fill", "justified"].freeze
  DEFAULT_WIDTH = "".freeze

  renders_many :items, Railsboot::Nav::ItemComponent

  def initialize(tag: "nav", style: DEFAULT_STYLE, width: DEFAULT_WIDTH, **html_attributes)
    @tag = tag
    @style = fetch_or_fallback(style, STYLES, DEFAULT_STYLE)
    @width = fetch_or_fallback(width, WIDTHS, DEFAULT_WIDTH)
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "nav",
      {"nav-#{@style}" => @style.present?},
      {"nav-#{@width}" => @width.present?},
      html_attributes.delete(:class)
    )
  end
end
