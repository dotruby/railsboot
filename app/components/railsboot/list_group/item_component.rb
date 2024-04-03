class Railsboot::ListGroup::ItemComponent < Railsboot::Component
  def initialize(tag: "li", active: false, disabled: false, color: nil, **html_attributes)
    @tag = tag
    @active = active
    @disabled = disabled
    @color = fetch_or_fallback(color, COLORS, "")
    @html_attributes = html_attributes

    @html_attributes[:tag] = @tag
    @html_attributes[:class] = class_names(
      "list-group-item",
      {"list-group-item-#{color}" => @color.present?},
      {"active" => @active},
      {"disabled" => @disabled},
      html_attributes.delete(:class)
    )
  end

  def call
    render(Railsboot::BaseComponent.new(tag: "li", **@html_attributes)) { content }
  end

  private

  def before_render
    @html_attributes["aria-current"] = "true" if @active
  end
end
