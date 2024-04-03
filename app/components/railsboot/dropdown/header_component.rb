class Railsboot::Dropdown::HeaderComponent < Railsboot::Component
  def initialize(text: "", **html_attributes)
    @text = text
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "dropdown-header",
      html_attributes.delete(:class)
    )
  end
end
