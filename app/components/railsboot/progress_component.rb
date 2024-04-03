class Railsboot::ProgressComponent < Railsboot::Component
  def initialize(value: 0, min: 0, max: 100, label: "", aria_label: nil, color: DEFAULT_COLOR, **html_attributes)
    @value = value
    @min = min
    @max = max
    @label = label
    @aria_label = aria_label
    @color = fetch_or_raise(color, COLORS)
    @html_attributes = html_attributes

    @html_attributes[:tag] = "div"
    @html_attributes[:class] = class_names(
      "progress",
      html_attributes.delete(:class)
    )
  end

  def inner_classes
    class_names(
      "progress-bar",
      {"bg-#{@color}" => @color.present?}
    )
  end

  protected

  def before_render
    @html_attributes["role"] = "progressbar"
    @html_attributes["aria-valuenow"] = @value
    @html_attributes["aria-valuemin"] = @min
    @html_attributes["aria-valuemax"] = @max
    @html_attributes["aria-label"] = @aria_label if @aria_label.present?
  end
end
