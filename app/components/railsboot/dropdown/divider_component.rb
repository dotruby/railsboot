class Railsboot::Dropdown::DividerComponent < Railsboot::Component
  def initialize(**html_attributes)
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "dropdown-divider",
      html_attributes.delete(:class)
    )
  end
end
