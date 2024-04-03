class Railsboot::CardComponent < Railsboot::Component
  renders_one :header, Railsboot::Card::HeaderComponent
  renders_many :bodies, Railsboot::Card::BodyComponent
  renders_many :list_groups, lambda { |**html_attributes|
    Railsboot::ListGroupComponent.new(flush: true, **html_attributes)
  }
  renders_one :footer, Railsboot::Card::FooterComponent

  def initialize(**html_attributes)
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "card",
      html_attributes.delete(:class)
    )
  end
end
