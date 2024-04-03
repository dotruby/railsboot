class Railsboot::SpinnerComponent < Railsboot::Component
  STYLES = ["border", "grow"].freeze
  DEFAULT_STYLE = "border".freeze

  def initialize(style: DEFAULT_STYLE, color: DEFAULT_COLOR, **html_attributes)
    @style = fetch_or_raise(style, STYLES)
    @color = fetch_or_raise(color, COLORS)
    @html_attributes = html_attributes

    @html_attributes[:tag] = "div"
    @html_attributes[:class] = class_names(
      "spinner-#{@style}",
      "text-#{@color}",
      html_attributes.delete(:class)
    )
  end

  private

  def before_render
    @html_attributes["role"] = "status"
  end
end
