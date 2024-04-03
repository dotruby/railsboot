class Railsboot::ListGroupComponent < Railsboot::Component
  renders_many :items, Railsboot::ListGroup::ItemComponent

  def initialize(flush: false, **html_attributes)
    @flush = flush
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "list-group",
      {"list-group-flush" => @flush},
      html_attributes.delete(:class)
    )
  end
end
