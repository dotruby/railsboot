class Railsboot::DropdownComponent < Railsboot::Component
  renders_one :action, Railsboot::Dropdown::ActionComponent

  renders_many :items, types: {
    link: {renders: Railsboot::Dropdown::LinkComponent, as: :link},
    divider: {renders: Railsboot::Dropdown::DividerComponent, as: :divider},
    header: {renders: Railsboot::Dropdown::HeaderComponent, as: :header}
  }

  def initialize(**html_attributes)
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "dropdown",
      html_attributes.delete(:class)
    )
  end
end
