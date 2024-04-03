require "test_helper"

class Railsboot::Table::BodyComponentTest < ViewComponent::TestCase
  test "renders table body component as the default" do
    render_inline(Railsboot::TableComponent.new) do |table|
      table.with_body { "Test" }
    end
    assert_selector "table.table" do
      assert_selector "tbody", text: "Test"
    end
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::TableComponent.new) do |table|
      table.with_body(id: "custom-id", class: "custom-class") { "Test" }
    end
    assert_selector "table.table" do
      assert_selector "tbody.custom-class"
      assert_selector "tbody#custom-id"
    end
  end
end
