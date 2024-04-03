class Railsboot::Dropdown::LinkComponent < Railsboot::Component
  def initialize(text: "", href: "", active: false, disabled: false, **html_attributes)
    @text = text
    @href = href
    @active = active
    @disabled = disabled
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "dropdown-item",
      {"active" => @active},
      {"disabled" => @disabled},
      html_attributes.delete(:class)
    )
  end

  private

  def before_render
    @html_attributes["aria-current"] = "true" if @active
    @html_attributes["aria-disabled"] = "true" if @disabled
  end
end
