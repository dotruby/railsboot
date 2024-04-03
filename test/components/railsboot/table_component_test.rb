require "test_helper"

class Railsboot::TableComponentTest < Minitest::Test
  include Railsboot::ComponentTestHelpers

  def test_renders_table_component_as_the_default
    render_inline(Railsboot::TableComponent.new)
    assert_selector "table.table"
  end

  def test_allows_any_additional_html_attribute
    render_inline(Railsboot::TableComponent.new(id: "my-id", class: "my-class"))
    assert_selector "table.table.my-class"
    assert_selector "table#my-id"
  end
end
