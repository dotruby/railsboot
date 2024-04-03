class Railsboot::Nav::ItemComponent < Railsboot::Component
  def initialize(text: "", href: "", active: false, disabled: false, wrapper_item: false, wrapper_tag: "li", wrapper_html_attributes: {}, **html_attributes)
    @text = text
    @href = href
    @active = active
    @disabled = disabled
    @html_attributes = html_attributes

    @wrapper_item = wrapper_item
    @wrapper_tag = wrapper_tag
    @wrapper_html_attributes = wrapper_html_attributes

    @html_attributes[:class] = class_names(
      "nav-link",
      {"active" => @active},
      {"disabled" => @disabled},
      html_attributes.delete(:class)
    )
  end

  def adjusted_wrapper_html_attributes
    @wrapper_html_attributes["class"] = ["nav-item", @wrapper_html_attributes.delete(:class)].compact_blank.uniq.join(" ")
    @wrapper_html_attributes
  end

  private

  def before_render
    @html_attributes["aria-current"] = "page" if @active
    @html_attributes["aria-disabled"] = "true" if @disabled
  end
end
