require "test_helper"

class Railsboot::TableComponentTest < ViewComponent::TestCase
  test "renders table component as the default" do
    render_inline(Railsboot::TableComponent.new)
    assert_selector "table.table"
  end

  test "allows any additional html_attribute" do
    render_inline(Railsboot::TableComponent.new(id: "my-id", class: "my-class"))
    assert_selector "table.table.my-class"
    assert_selector "table#my-id"
  end
end
