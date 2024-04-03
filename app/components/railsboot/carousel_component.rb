class Railsboot::CarouselComponent < Railsboot::Component
  renders_many :items, Railsboot::Carousel::ItemComponent

  def initialize(id:, **html_attributes)
    @id = id
    @html_attributes = html_attributes

    @html_attributes[:id] = @id
    @html_attributes[:class] = class_names(
      "carousel",
      "slide"
    )
  end
end
