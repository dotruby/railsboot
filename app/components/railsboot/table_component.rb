class Railsboot::TableComponent < Railsboot::Component
  renders_one :head, Railsboot::Table::HeadComponent
  renders_one :body, Railsboot::Table::BodyComponent

  def initialize(**html_attributes)
    @html_attributes = html_attributes

    @html_attributes[:tag] = "table"
    @html_attributes[:class] = class_names(
      "table",
      html_attributes.delete(:class)
    )
  end
end
