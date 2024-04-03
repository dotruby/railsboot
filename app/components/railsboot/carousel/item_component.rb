class Railsboot::Carousel::ItemComponent < Railsboot::Component
  attr_reader :active

  def initialize(active: false, **html_attributes)
    @active = active
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "carousel-item",
      {"active" => @active},
      html_attributes.delete(:class)
    )
  end
end
