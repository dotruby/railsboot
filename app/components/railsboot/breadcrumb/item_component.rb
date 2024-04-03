class Railsboot::Breadcrumb::ItemComponent < Railsboot::Component
  def initialize(text: "", href: "", active: false, **html_attributes)
    @text = text
    @href = href
    @active = active
    @html_attributes = html_attributes

    @html_attributes[:tag] = "li"
    @html_attributes[:class] = class_names(
      "breadcrumb-item",
      {"active" => @active},
      html_attributes.delete(:class)
    )
  end

  protected

  def before_render
    @html_attributes["aria-current"] = "page" if @active
  end
end
