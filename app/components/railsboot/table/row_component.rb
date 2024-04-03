class Railsboot::Table::RowComponent < Railsboot::Component
  renders_many :cells, Railsboot::Table::CellComponent

  def initialize(**html_attributes)
    @html_attributes = html_attributes
  end
end
