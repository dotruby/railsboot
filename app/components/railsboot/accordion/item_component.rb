class Railsboot::Accordion::ItemComponent < Railsboot::Component
  renders_one :header
  renders_one :body

  def initialize(id:, parent_id: "", expanded: false, **html_attributes)
    @id = id
    @parent_id = parent_id
    @expanded = expanded
    @html_attributes = html_attributes

    @html_attributes[:tag] = "div"
    @html_attributes[:class] = class_names(
      "accordion-item",
      html_attributes.delete(:class)
    )
  end

  def parent_reference
    @parent_id.present? ? {bs_parent: "##{@parent_id}"} : {}
  end
end
