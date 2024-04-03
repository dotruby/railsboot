class Railsboot::AlertComponent < Railsboot::Component
  def initialize(color: DEFAULT_COLOR, dismissible: false, **html_attributes)
    @color = fetch_or_raise(color, COLORS)
    @dismissible = dismissible
    @html_attributes = html_attributes

    @html_attributes[:tag] = "div"
    @html_attributes[:class] = class_names(
      "alert",
      "alert-#{@color}",
      {"alert-dismissible fade show" => @dismissible},
      html_attributes.delete(:class)
    )
  end

  protected

  def before_render
    @html_attributes["role"] = "alert"
  end
end
