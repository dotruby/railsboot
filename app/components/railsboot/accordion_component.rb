class Railsboot::AccordionComponent < Railsboot::Component
  renders_many :items, Railsboot::Accordion::ItemComponent

  def initialize(flush: false, **html_attributes)
    @flush = flush
    @html_attributes = html_attributes

    @html_attributes[:tag] = "div"
    @html_attributes[:class] = class_names(
      "accordion",
      {"accordion-flush" => @flush},
      html_attributes.delete(:class)
    )
  end
end
