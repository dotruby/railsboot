require "test_helper"

class Railsboot::Table::HeadComponentTest < ViewComponent::TestCase
  test "renders table head component as the default" do
    render_inline(Railsboot::TableComponent.new) do |table|
      table.with_head { "Test" }
    end
    assert_selector "table.table" do
      assert_selector "thead", text: "Test"
    end
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::TableComponent.new) do |table|
      table.with_head(id: "custom-id", class: "custom-class") { "Test" }
    end
    assert_selector "table.table" do
      assert_selector "thead.custom-class"
      assert_selector "thead#custom-id"
    end
  end
end
