class Railsboot::Table::BodyComponent < Railsboot::Component
  renders_many :rows, Railsboot::Table::RowComponent

  def initialize(**html_attributes)
    @html_attributes = html_attributes
  end
end
