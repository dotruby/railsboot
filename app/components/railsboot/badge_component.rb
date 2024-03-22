class Railsboot::BadgeComponent < Railsboot::Component
  def initialize(pill: false, color: DEFAULT_COLOR, **html_attributes)
    @pill = pill
    @color = fetch_or_raise(color, COLORS)
    @html_attributes = html_attributes

    @html_attributes[:tag] = :span
    @html_attributes[:class] = class_names(
      "badge",
      "bg-#{@color}",
      {"rounded-pill" => @pill},
      html_attributes.delete(:class)
    )
  end
end
