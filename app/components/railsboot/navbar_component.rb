class Railsboot::NavbarComponent < Railsboot::Component
  EXPANDS = ["sm", "md", "lg", "xl", "xxl"].freeze
  DEFAULT_EXPAND = "".freeze

  def initialize(expand: DEFAULT_EXPAND, **html_attributes)
    @expand = fetch_or_fallback(expand, EXPANDS, DEFAULT_EXPAND)
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "navbar",
      {"navbar-expand-#{@expand}" => @expand.present?},
      html_attributes.delete(:class)
    )
  end
end
