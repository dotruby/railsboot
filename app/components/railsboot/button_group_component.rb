class Railsboot::ButtonGroupComponent < Railsboot::Component
  SIZES = ["", "lg", "sm"].freeze
  DEFAULT_SIZE = "".freeze

  def initialize(aria_label: "", size: DEFAULT_SIZE, **html_attributes)
    @aria_label = aria_label
    @size = fetch_or_fallback(size, SIZES, DEFAULT_SIZE)
    @html_attributes = html_attributes

    @html_attributes[:tag] = "div"
    @html_attributes[:class] = class_names(
      "btn-group",
      {"btn-group-#{@size}" => @size.present?},
      html_attributes.delete(:class)
    )
  end

  protected

  def before_render
    @html_attributes["role"] = "group"
    @html_attributes["aria-label"] = @aria_label if @aria_label.present?
  end
end
